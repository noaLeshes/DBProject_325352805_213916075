CREATE OR REPLACE FUNCTION get_all_devices_maintenance
RETURN SYS_REFCURSOR
AS
    v_result SYS_REFCURSOR;

    -- Declare constants for maintenance thresholds
    c_full_service_threshold CONSTANT NUMBER := 15;
    c_inspection_threshold CONSTANT NUMBER := 5;

BEGIN
    OPEN v_result FOR
        SELECT d.device_number, d.device_model, d.hall_number, d.gym_number,
               g.gym_name, COUNT(u.class_number) AS usage_count,
               CASE
                   WHEN COUNT(u.class_number) >= c_full_service_threshold THEN 'Full Service'
                   WHEN COUNT(u.class_number) >= c_inspection_threshold THEN 'Inspection'
                   ELSE 'Routine Check'
               END AS maintenance_type,
               CASE
                   WHEN COUNT(u.class_number) >= c_full_service_threshold THEN SYSDATE + 7
                   WHEN COUNT(u.class_number) >= c_inspection_threshold THEN SYSDATE + 14
                   ELSE SYSDATE + 30
               END AS maintenance_date
        FROM device d
        JOIN hall h ON d.hall_number = h.hall_number AND d.gym_number = h.gym_number
        JOIN gym g ON h.gym_number = g.gym_number
        LEFT JOIN used_in u ON d.device_number = u.device_number
        GROUP BY d.device_number, d.device_model, d.hall_number, d.gym_number, g.gym_name;

    RETURN v_result;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        RAISE;
END get_all_devices_maintenance;
/
