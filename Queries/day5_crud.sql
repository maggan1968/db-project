/**
  IntelliJ Comes with great visual feature to
  create tables and perform crud operation on that table
        -- C (Create new row)
        -- R (Read rows)
        -- U (Update rows)
        -- D (Delete rows)
  It will also help to generate the query needed to make it happen
  Here is the MESSAGE Table with 2 Columns (MESSAGE_ID, CONTENT) we did

 */
-- CREATING TABLE
CREATE TABLE MASSAGES
(
    MESSAGE_ID NUMBER       not null
        constraint MASSAGE_PK
            primary key,
    CONTENT    VARCHAR2(50) not null
);


-- ADDING ROW
INSERT INTO MASSAGES (MESSAGE_ID, CONTENT)
VALUES (2, 'B25 LIKE REPEATING');


-- READING ROW
SELECT * FROM MASSAGES ;


-- UPDATING ROW
UPDATE MASSAGES
SET CONTENT = 'B25 LIKE LEARNING'
WHERE MESSAGE_ID = 2;

-- DELETING ROW
DELETE
FROM MASSAGES
WHERE MESSAGE_ID = 2;

-- HOW TO CLEAR EVERYTHING IN THE TABLE
-- TRUNCATE
TRUNCATE TABLE MASSAGES ;

-- HOW TO MODIFY THE TABLE -- LIKE ADDING COLUMN
ALTER TABLE MASSAGES
    ADD column_3 INTEGER;
-- HOW TO COMPLETELY DELETE A TABLE

DROP TABLE MASSAGES ;