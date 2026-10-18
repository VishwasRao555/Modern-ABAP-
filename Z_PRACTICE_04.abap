CLASS z_practice_04 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_practice_04 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
"========================================================
" IMPORTANT SYSTEM FIELDS
"========================================================
" sy-subrc : Indicates weather a statement is Processed Successful or not .
" If sy-subrc = 0 (It Indicates Success) , IF sy-subrc is not equal to 0 them UnSuccessful.

" sy-dbcnt : Represents the Number of database rows processed or Effected.

" sy-tabix : Index for applicable internal table operations or DataBase Table.

" sy-index : DO loop iteration counter ( Specifies the count of Iteration ).

"========================================================
" SELECT Statement ( Read from a Database Table)
"========================================================

  SELECT FROM zpracticetable01
  FIELDS * " All Fields in the Database table
  INTO TABLE @DATA(it_01)."In-line Declaration

  SELECT FROM zpracticetable01
  FIELDS rollno , name , city
  INTO TABLE @DATA(it_02).

  SELECT FROM zpracticetable01
  FIELDS rollno , name , city
  WHERE city = 'Karimnagar' AND name = 'vishwas'
  INTO TABLE @DATA(it_03).

  SELECT FROM zpracticetable01
  FIELDS rollno , name , city
  WHERE rollno between 1201 and 1205
  ORDER BY rollno  DESCENDING
  INTO TABLE @DATA(it_04).

  SELECT SINGLE FROM zpracticetable01 " Will Fetch only one record
  FIELDS rollno , name , city
  WHERE city = 'Karimnagar' AND name = 'vishwas'
  INTO  @DATA(it_05)." Into a Work Area not a Table

  SELECT FROM zpracticetable01
  FIELDS rollno , name , city
  WHERE city IS INITIAL " Will Fetch Records with Empty City (or) Initial Value
  INTO TABLE @DATA(it_06).

  IF sy-subrc = 0.
     out->write( it_06 ).
  Else.
     out->write( 'Not Found' ).
  ENDIF.

"========================================================
" INSERT into a Database Table
"========================================================
"Single record

  DATA(it_zpracticetable01) = VALUE zpracticetable01( rollno = 1201 name = 'Akash'  class = '1st Year' ).

  INSERT zpracticetable01 from @it_zpracticetable01."We have to use @ symbol to mention the database table

" Multiple records
  DATA it_zpracticetable02 type table of zpracticetable01."Declaring a Internal Table of type Database Table

  it_zpracticetable02 = VALUE #(  "OR we can use the I
    ( rollno = 1202 name = 'vishwas' city = 'Karimnager' class = '4th Year' )
    ( rollno = 1203 name = 'neeraj' city = 'Karimnager' class = '3rd Year' )
    ( rollno = 1204 name = 'dinesh' city = 'Warangal' class = '4th Year' )
    ( rollno = 1205 name = 'krishna' city = 'Karimnager' class = '4th Year' )
    ( rollno = 1206 name = 'vinayak' city = 'Bangalore' class = '2nd Year' )
   ).

   INSERT zpracticetable01 from table @it_zpracticetable02."We have to use @ symbol to mention the database table


"========================================================
" UPDATE a Database Table
"========================================================

UPDATE zpracticetable01
  SET city = 'Hyderabad'
  WHERE rollno = 1201." Will Update a record

  out->write( sy-dbcnt )." Shows the No.of Rows Effected

"========================================================
" MODIFY a Database Table
"========================================================

DATA(ls_student) = VALUE zpracticetable01(
  rollno =  1201
  name   = 'Rahul'
  city   = 'Hyderabad'
  class  = '2nd year' " Will Modify a record
).

MODIFY zpracticetable01 FROM @ls_student.

 out->write( sy-dbcnt )." Shows the No.of Rows Effected

"========================================================
" DIFFERENCE BETWEEN UPDAT AND MODIFY
"========================================================

"UPDATE changes the existing records and MODIFY inserts or updates the records depending
"on whether the primary key already exists.(If Primary key is not Exist it will insert a new record)


"========================================================
" DIFFERENCE BETWEEN UPDAT AND MODIFY
"========================================================
DELETE FROM zpracticetable01
  WHERE rollno = 1206.

  IF sy-subrc = 0.
     out->write( 'Delected Successfully' ).
  Else.
     out->write( 'Error While Deleting' ).
  ENDIF.

  ENDMETHOD.
ENDCLASS.
