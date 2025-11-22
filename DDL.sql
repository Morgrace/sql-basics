USE MyDatabase
-- NOTE (DDL) DATA DEFINITION LANGUAGE
CREATE TABLE
    persons (
        id INT NOT NULL,
        person_name VARCHAR(50) NOT NULL,
        birth_date DATE,
        phone VARCHAR(15) NOT NULL,
        CONSTRAINT pk_persons PRIMARY KEY (id)
    )
    --     -- NOTE adding to the table
ALTER TABLE persons ADD email VARCHAR(50) NOT NULL
-- -- NOTE removing columns
ALTER TABLE persons
DROP COLUMN phone
-- -- NOTE DELETING A TABLE USE WITH CAUTION
DROP TABLE persons