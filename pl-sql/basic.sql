-- MANDETORY BLock
-- declare 
--  myvar integer := 12;
begin
  dbms_output.put_line(myvar);
end;

--------------------------------

first_name = 'Thbs';
fullName = first_name + 'AMC'


-- This single line commet 
-- Anonymous Block
/* This multi line comments */
DECLARE
   var1 integer CONSTANT NOT NULL;
   var2 integer := 40;
   var3 varchar (20);
BEGIN
  var3 := 'THBS';
   dbms_output.put_line('Value of var3: ' || var3);
END;

---------------------------------------
-- Subproram in PL/SQL
CREATE OR REPLACE PROCEDURE greetings  
AS  
BEGIN  
   dbms_output.put_line('Hello World!');  
END; 
Procedure created.

this getting strore inside DB -
-----------------------------------------
EXECUTE greetings
-----------------------------------------


