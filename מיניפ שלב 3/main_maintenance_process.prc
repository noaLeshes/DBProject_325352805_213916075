CREATE OR REPLACE PROCEDURE main_maintenance_process
AS
    v_devices_cursor SYS_REFCURSOR;
    v_device_number NUMBER;
    v_device_model VARCHAR2(100);
    v_hall_number NUMBER;
    v_gym_number NUMBER;
    v_gym_name VARCHAR2(100);
    v_usage_count NUMBER;
    v_maintenance_type VARCHAR2(20);
    v_maintenance_date DATE;
    
    v_devices_to_swap SYS_REFCURSOR;
    v_devices_swapped NUMBER := 0;
    v_total_devices NUMBER := 0;
BEGIN
    -- Get all devices needing maintenance
    v_devices_cursor := get_all_devices_maintenance();
    
    DBMS_OUTPUT.PUT_LINE('Devices needing maintenance:');
    DBMS_OUTPUT.PUT_LINE('-----------------------------');
    
    -- First pass: Print maintenance information and count devices to swap
    LOOP
        FETCH v_devices_cursor INTO 
            v_device_number, v_device_model, v_hall_number, v_gym_number,
            v_gym_name, v_usage_count, v_maintenance_type, v_maintenance_date;
        EXIT WHEN v_devices_cursor%NOTFOUND;
        
        v_total_devices := v_total_devices + 1;
        
        IF v_maintenance_type IN ('Full Service', 'Inspection') THEN
                  DBMS_OUTPUT.PUT_LINE('Device: ' || v_device_number || 
                             ', Model: ' || v_device_model || 
                            ', Gym: ' || v_gym_name ||
                             ', Maintenance: ' || v_maintenance_type || 
                             ', Date: ' || TO_CHAR(v_maintenance_date, 'YYYY-MM-DD'));
            v_devices_swapped := v_devices_swapped + 1;
        END IF;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('-----------------------------');
    DBMS_OUTPUT.PUT_LINE('Total devices: ' || v_total_devices);
    DBMS_OUTPUT.PUT_LINE('Devices to swap: ' || v_devices_swapped);
    DBMS_OUTPUT.PUT_LINE('');
    
    -- Close and reopen the cursor for the second pass
    CLOSE v_devices_cursor;
    v_devices_cursor := get_all_devices_maintenance();
    
    -- Second pass: Perform device swaps
    DBMS_OUTPUT.PUT_LINE('Performing device swaps:');
    DBMS_OUTPUT.PUT_LINE('-----------------------------');
    
    LOOP
        FETCH v_devices_cursor INTO 
            v_device_number, v_device_model, v_hall_number, v_gym_number,
            v_gym_name, v_usage_count, v_maintenance_type, v_maintenance_date;
        EXIT WHEN v_devices_cursor%NOTFOUND;
        
        IF v_maintenance_type IN ('Full Service', 'Inspection') THEN
            -- Create a cursor for this specific device
            OPEN v_devices_to_swap FOR
                SELECT v_device_number AS device_number, 
                       v_device_model AS device_model, 
                       v_gym_number AS gym_number
                FROM DUAL;
            
            -- Swap this device
            swap_devices_for_maintenance(v_devices_to_swap);
            
            CLOSE v_devices_to_swap;
        END IF;
    END LOOP;
    
    -- Close the main cursor
    CLOSE v_devices_cursor;
    
    DBMS_OUTPUT.PUT_LINE('-----------------------------');
    DBMS_OUTPUT.PUT_LINE('Maintenance process completed.');
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred in main_maintenance_process: ' || SQLERRM);
        -- Close cursors if they are open
        IF v_devices_cursor%ISOPEN THEN
            CLOSE v_devices_cursor;
        END IF;
        IF v_devices_to_swap%ISOPEN THEN
            CLOSE v_devices_to_swap;
        END IF;
        RAISE;
END main_maintenance_process;
/
