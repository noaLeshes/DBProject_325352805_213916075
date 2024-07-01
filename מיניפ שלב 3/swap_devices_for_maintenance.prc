CREATE OR REPLACE PROCEDURE swap_devices_for_maintenance(
    p_devices_cursor IN SYS_REFCURSOR DEFAULT NULL,
    p_device_id IN NUMBER DEFAULT NULL
)
AS
    v_device_id NUMBER;
    v_model VARCHAR2(100);
    v_gym_number NUMBER;
    v_new_device_id NUMBER;
    v_classes_updated NUMBER := 0;
    v_total_devices_updated NUMBER := 0;
    -- Custom exception
    no_available_device EXCEPTION;
    -- Cursor to fetch classes using the original device
    CURSOR class_cursor(p_device_id NUMBER) IS
        SELECT class_number
        FROM used_in
        WHERE device_number = p_device_id;

    PROCEDURE process_single_device(p_device_id IN NUMBER) IS
    BEGIN
        -- Fetch device details
        SELECT device_number, device_model, gym_number
        INTO v_device_id, v_model, v_gym_number
        FROM device
        WHERE device_number = p_device_id;

        -- Find an available device of the same model in the same gym
        SELECT device_number
        INTO v_new_device_id
        FROM device d
        WHERE d.device_model = v_model
          AND d.gym_number = v_gym_number
          AND d.device_number != v_device_id
          AND NOT EXISTS (
              SELECT 1
              FROM used_in u
              WHERE u.device_number = d.device_number
          )
        AND ROWNUM = 1;

        -- Update all classes to use the new device
        v_classes_updated := 0;
        FOR class_rec IN class_cursor(v_device_id) LOOP
            UPDATE used_in
            SET device_number = v_new_device_id
            WHERE class_number = class_rec.class_number
              AND device_number = v_device_id;
            v_classes_updated := v_classes_updated + SQL%ROWCOUNT;
        END LOOP;

        v_total_devices_updated := v_total_devices_updated + 1;

        -- Output results for the device
        DBMS_OUTPUT.PUT_LINE('Device swap completed for device ID: ' || v_device_id);
        DBMS_OUTPUT.PUT_LINE('New Device ID: ' || v_new_device_id);
        DBMS_OUTPUT.PUT_LINE('Number of classes updated: ' || v_classes_updated);
        DBMS_OUTPUT.PUT_LINE('-----------------------------');

        -- Commit the transaction for this device
        COMMIT;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Error: No available device of the same model found for device ID: ' || v_device_id);
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('An unexpected error occurred for device ID ' || v_device_id || ': ' || SQLERRM);
            -- Rollback changes for this device
            ROLLBACK;
    END process_single_device;

BEGIN
    IF p_devices_cursor IS NOT NULL THEN
        -- Process devices from the cursor
        LOOP
            FETCH p_devices_cursor INTO v_device_id, v_model, v_gym_number;
            EXIT WHEN p_devices_cursor%NOTFOUND;
            
            process_single_device(v_device_id);
        END LOOP;
    ELSIF p_device_id IS NOT NULL THEN
        -- Process a single device
        process_single_device(p_device_id);
    ELSE
        -- No input provided
        RAISE_APPLICATION_ERROR(-20001, 'Either a cursor or a device ID must be provided.');
    END IF;

    -- Output total results
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
        -- Rollback any changes
        ROLLBACK;
END swap_devices_for_maintenance;
/
