CREATE OR REPLACE PROCEDURE update_classes_by_popularity(
    p_popularity_threshold IN NUMBER
) AS
    -- Record type for class information
    TYPE class_rec IS RECORD (
        class_number NUMBER,
        class_name VARCHAR2(15),
        capacity NUMBER,
        current_occupancy NUMBER,
        popularity_rate NUMBER,
        coach_id NUMBER,
        hall_number NUMBER,
        gym_number NUMBER
    );
  
    -- Table type for storing multiple class records
    TYPE class_tab IS TABLE OF class_rec;
    
    -- Cursor to fetch classes
    CURSOR class_cur IS
        SELECT cl.class_number, cl.class_name, cl.capacity, 
               COUNT(t.person_id) AS current_occupancy,
               (COUNT(t.person_id) / cl.capacity * 100) AS popularity_rate,
               cl.person_id AS coach_id, cl.hall_number, cl.gym_number
        FROM class_lesson cl
        LEFT JOIN takes t ON cl.class_number = t.class_number
        GROUP BY cl.class_number, cl.class_name, cl.capacity, cl.person_id, cl.hall_number, cl.gym_number
        HAVING (COUNT(t.person_id) / cl.capacity * 100) >= p_popularity_threshold
        ORDER BY popularity_rate DESC;
    
    v_classes class_tab;
    v_new_capacity NUMBER;
    v_new_hall_number NUMBER;
    v_new_gym_number NUMBER;
    v_coach_speciality VARCHAR2(50);
    v_update_count NUMBER := 0;
    v_skip_count NUMBER := 0;
    my_capacity NUMBER;

BEGIN
    -- Fetch classes into the table of records
    OPEN class_cur;
    FETCH class_cur BULK COLLECT INTO v_classes;
    CLOSE class_cur;
    
    -- Process each class
    FOR i IN 1..v_classes.COUNT LOOP
        -- Get coach speciality
        SELECT speciality INTO v_coach_speciality
        FROM coach
        WHERE person_id = v_classes(i).coach_id;
        
        -- Calculate new capacity (10% increase, rounded up)
        v_new_capacity := CEIL(v_classes(i).capacity * 1.1);
        
        -- Find a suitable hall for the expanded class
        SELECT aa.capacity INTO my_capacity
        FROM hall aa
        WHERE aa.hall_number = v_classes(i).hall_number;
         
        IF my_capacity < v_new_capacity THEN
            BEGIN
                SELECT ha.hall_number, ha.gym_number
                INTO v_new_hall_number, v_new_gym_number
                FROM (
                    SELECT h.hall_number, h.gym_number
                    FROM hall h
                    WHERE h.capacity >= v_new_capacity
                      AND h.gym_number = v_classes(i).gym_number
                      AND h.hall_number != v_classes(i).hall_number
                      AND NOT EXISTS (
                          SELECT 1 
                          FROM class_lesson cl
                          WHERE cl.hall_number = h.hall_number
                            AND cl.gym_number = h.gym_number
                            AND cl.class_day = (
                                SELECT cc.class_day
                                FROM class_lesson cc
                                WHERE cc.class_number = v_classes(i).class_number
                            )
                            AND cl.class_hour = (
                                SELECT ccc.class_hour 
                                FROM class_lesson ccc
                                WHERE ccc.class_number = v_classes(i).class_number
                            )
                      )
                ) ha
                WHERE ROWNUM = 1;
                            
                -- Update the class
                UPDATE class_lesson c1
                SET c1.capacity = v_new_capacity,
                    c1.hall_number = v_new_hall_number,
                    c1.gym_number = v_new_gym_number
                WHERE c1.class_number = v_classes(i).class_number;
                commit;
                
                v_update_count := v_update_count + 1;
                
                -- Log the update
                DBMS_OUTPUT.PUT_LINE('Updated Class: ' || v_classes(i).class_name || 
                                     ' (ID: ' || v_classes(i).class_number || ')');
                DBMS_OUTPUT.PUT_LINE('Old Hall Capacity: ' || my_capacity ||
                                     ', New Capacity: ' || v_new_capacity || 
                                     ', New Hall: ' || v_new_hall_number );
                DBMS_OUTPUT.PUT_LINE('-----------------------------');
 
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    -- No suitable hall found, skip this class
                    v_skip_count := v_skip_count + 1;
                    DBMS_OUTPUT.PUT_LINE('Skipped Class: ' || v_classes(i).class_name || 
                                         ' (ID: ' || v_classes(i).class_number || ') - No suitable hall found');
                    DBMS_OUTPUT.PUT_LINE('-----------------------------'); 
            END;
            ELSE
                -- Update the class
                UPDATE class_lesson c2
                SET c2.capacity = v_new_capacity
                WHERE c2.class_number = v_classes(i).class_number;
                commit;
                v_update_count := v_update_count + 1;
               -- Log the update
                DBMS_OUTPUT.PUT_LINE('Updated Class: ' || v_classes(i).class_name || 
                                     ' (ID: ' || v_classes(i).class_number || ')');
                DBMS_OUTPUT.PUT_LINE('Old Hall Capacity: ' || my_capacity ||
                                     ', New Capacity: ' || v_new_capacity || 
                                     ', Same Hall ' );
                DBMS_OUTPUT.PUT_LINE('-----------------------------');
        END IF;
    END LOOP;
    
    -- Final summary
    DBMS_OUTPUT.PUT_LINE('-----------------------------');
    DBMS_OUTPUT.PUT_LINE('Update Summary:');
    DBMS_OUTPUT.PUT_LINE('Classes updated: ' || v_update_count);
    DBMS_OUTPUT.PUT_LINE('Classes skipped: ' || v_skip_count);
    DBMS_OUTPUT.PUT_LINE('Total classes processed: ' || v_classes.COUNT);

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        RAISE;
END update_classes_by_popularity;
/
