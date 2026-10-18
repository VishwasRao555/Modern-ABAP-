CLASS z_practice_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_practice_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* IF , ELSEIF and ELSE Statements.

DATA(lv_marks) = 85.

IF lv_marks >= 90.
  out->write( `Grade A` ).
ELSEIF lv_marks >= 75.
  out->write( `Grade B` ).
ELSEIF lv_marks >= 50.
  out->write( `Grade C` ).
ELSE.
  out->write( `Fail` ).
ENDIF.

* CASE Statements

DATA(lv_choice) = 2.

CASE lv_choice.
  WHEN 1.
    out->write( `Create` ).
  WHEN 2.
    out->write( `Read` ).
  WHEN 3.
    out->write( `Update` ).
  WHEN 4.
    out->write( `Delete` ).
  WHEN OTHERS.
    out->write( `Invalid choice` ).
ENDCASE.

* LOOPS

* DO Loop
Do 5 times.
  out->write( sy-index )." This sy-index will represent the current Iteration of a LOOP
ENDDo.

* DO with COUNTINUE and EXIT

DO 10 TIMES.

  IF sy-index = 3. " Only Skip the Iteration 3 and Move to the Iteration 4
    CONTINUE.
  ENDIF.

  IF sy-index = 7. " Exits the DO Loop at Iteration 7
    EXIT.
  ENDIF.

  out->write( |{ sy-index }| ).

ENDDO.

* WHILE LOOP

data(count) = 1.

WHILE count <= 5.
 out->write( | Counter : { count } |  )."String Templets
 count  = count + 1.
ENDWHILE.

* LOOP AT (Mostly Used in Tables)

TYPES: BEGIN OF ty_student,
         roll_no TYPE i,
         name    TYPE string,
         marks   TYPE i,
       END OF ty_student.

DATA lt_students TYPE TABLE OF ty_student .

lt_students = VALUE #(
  ( roll_no = 101 name = 'Rahul' marks = 85 )
  ( roll_no = 102 name = 'Priya' marks = 92 )
  ( roll_no = 103 name = 'Kiran' marks = 45 )
).

LOOP AT lt_students INTO DATA(ls_student)." Every Record of lt_students will do into ls_student one by one
  IF ls_student-marks >= 50.
    out->write(
      |{ sy-tabix } --> { ls_student-roll_no } { ls_student-name } { ls_student-marks }|
    ).
    " Here we use the "sy-tabix" for LOOP AT .
    "It Represents the Current Table index or Current Iteration of the LOOP in the LOOP AT Syntax
  ENDIF.
ENDLOOP.

  ENDMETHOD.
ENDCLASS.
