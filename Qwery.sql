CREATE OR REPLACE FUNCTION get_average_product_price()
RETURNS numeric AS $$
DECLARE
    avg_price numeric;
BEGIN
    SELECT AVG(unit_price) INTO avg_price FROM products;
    RETURN avg_price;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION get_youngest_employee()
RETURNS TABLE (
    youngest_employee_id smallint,
    youngest_employee_name character varying(30),
    youngest_employee_birth_date date
) AS $$
BEGIN
    SELECT
        employee_id, first_name || ' ' || last_name, birth_date
    INTO
        youngest_employee_id, youngest_employee_name, youngest_employee_birth_date
    FROM
        employees
    ORDER BY
        birth_date ASC
    LIMIT 1;

    RETURN;
END;
$$ LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION get_oldest_employee()
RETURNS TABLE (
    oldest_employee_id smallint,
    oldest_employee_name character varying(30),
    oldest_employee_birth_date date
) AS $$
BEGIN
    SELECT
        employee_id, first_name || ' ' || last_name, birth_date
    INTO
        oldest_employee_id, oldest_employee_name, oldest_employee_birth_date
    FROM
        employees
    ORDER BY
        birth_date DESC
    LIMIT 1;

    RETURN;
END;
$$ LANGUAGE plpgsql;