CREATE OR ALTER PROCEDURE usp_load_dim_employee
AS
BEGIN
    MERGE dwh.dim_employee AS TARGET
    USING staging.employee AS SOURCE
    ON TARGET.employee_id = SOURCE.employee_id
    WHEN MATCHED THEN
        UPDATE SET
            first_name = SOURCE.first_name,
            status = SOURCE.status,
            status_date = SOURCE.status_date
    WHEN NOT MATCHED THEN
        INSERT (source_system, employee_id, first_name, last_name, status, status_date)
        VALUES ('GreenHR', SOURCE.employee_id, SOURCE.first_name, SOURCE.last_name, SOURCE.status, SOURCE.status_date);
END
