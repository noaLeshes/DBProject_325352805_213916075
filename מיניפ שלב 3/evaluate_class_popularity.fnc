CREATE OR REPLACE FUNCTION evaluate_class_popularity(
    p_class_number IN NUMBER,
    p_result_cursor OUT SYS_REFCURSOR
) RETURN class_popularity_result
AS
    v_current_capacity NUMBER;
    v_max_capacity NUMBER;
    v_occupancy_rate NUMBER;
    v_class_name VARCHAR2(15);
    v_recommendation VARCHAR2(200);
    v_result class_popularity_result;
    
    -- Custom exception
    class_not_found EXCEPTION;
    PRAGMA EXCEPTION_INIT(class_not_found, -20001);
BEGIN
    -- Check if the class exists
    BEGIN
        SELECT cl.capacity, cl.class_name
        INTO v_max_capacity, v_class_name
        FROM class_lesson cl
        WHERE cl.class_number = p_class_number;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE class_not_found;
    END;
    
    -- Calculate current occupancy
    SELECT COUNT(*)
    INTO v_current_capacity
    FROM takes
    WHERE class_number = p_class_number;
    
    -- Calculate occupancy rate
    v_occupancy_rate := (v_current_capacity / v_max_capacity) * 100;
    
    -- Evaluate popularity and make recommendation
    IF v_occupancy_rate >= 90 THEN
        v_recommendation := 'Highly popular. Consider opening a new session.';
    ELSIF v_occupancy_rate >= 75 THEN
        v_recommendation := 'Popular. Monitor closely for potential expansion.';
    ELSIF v_occupancy_rate >= 50 THEN
        v_recommendation := 'Moderate popularity. No immediate action required.';
    ELSE
        v_recommendation := 'Low popularity. Consider marketing or schedule adjustments.';
    END IF;
    
    -- Create the result object
    v_result := class_popularity_result(p_class_number, v_occupancy_rate, v_recommendation);
    
    -- Open the cursor with the same values
    OPEN p_result_cursor FOR
    SELECT p_class_number AS class_number, 
           v_occupancy_rate AS popularity_rate, 
           v_recommendation AS recommendation
    FROM dual;

    RETURN v_result;
EXCEPTION
    WHEN class_not_found THEN
        -- Open cursor with error message
        OPEN p_result_cursor FOR
        SELECT NULL AS class_number, 
               NULL AS popularity_rate, 
               'Error: Class not found.' AS recommendation
        FROM dual;
        -- Return NULL for all fields if class is not found
        RETURN class_popularity_result(NULL, NULL, 'Error: Class not found.');
    WHEN OTHERS THEN
        -- Open cursor with error message
        OPEN p_result_cursor FOR
        SELECT NULL AS class_number, 
               NULL AS popularity_rate, 
               'An unexpected error occurred: ' 
        FROM dual;
        -- Return NULL for all fields if an unexpected error occurs
        RETURN class_popularity_result(NULL, NULL, 'An unexpected error occurred: ' || SQLERRM);
END evaluate_class_popularity;
/
