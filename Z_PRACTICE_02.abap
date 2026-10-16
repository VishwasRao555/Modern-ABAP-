CLASS z_practice_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_practice_02 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  TYPES: BEGIN OF st_student,
         Name TYPE c LENGTH 15,
         DOB TYPE d,
         Class TYPE c LENGTH 10,
         City TYPE c LENGTH 10,
         END OF st_student.

* CREATING A TABLE TYPE FROM A STRUCTURE
  TYPES itt_student TYPE TABLE OF st_student.

* CREATING A INTERNAL TABLE OF A TABLE TYPE
  DATA it_student1 TYPE itt_student.

* CREATING A INTERNAL TABLE OF A STRUCTURE
  DATA it_student2 TYPE TABLE OF st_student.

* CREATING A WORK AREA FROM A INTERNAL TABLE
  DATA wa_student1 LIKE LINE OF it_student1. " WE USE "LIKE LINE OF" WHEN WE ARE REFERING TO A INTERNAL TABLE'S RECORD

* OR WE CAN USE THE STRUCTURE TYPE AS THE REFERENCE TYPE FOR THE WORK AREA
  DATA wa_student2 TYPE st_student.

* DIRECTLY ADDING ONE RECORD AT A TIME INTO A INTERNAL TABLE USING THE "VALUE #"
  APPEND VALUE #( Name = 'Vishwas' DOB = '20050720'  Class = '4th Year'  City = 'Karimnagar' ) TO it_student1.
  APPEND VALUE #( Name = 'Neeraj' DOB = '20060708'  Class = '3rd Year'  City = 'Karimnagar' ) TO it_student1.



* DIRECTLY ADDING MULTIPLE RECORDS INTO A INTERNAL TABLE USING THE "VALUE #"
  it_student2 = VALUE #(
  ( Name = 'Vishwas' DOB = '20050720'  Class = '4th Year'  City = 'Karimnagar' )
  ( Name = 'Neeraj' DOB = '20060708'  Class = '3rd Year'  City = 'Karimnagar' )
  ( Name = 'Vinayak' DOB = '20051225'  Class = '4th Year'  City = 'Karimnagar' )
   ).

* USING WORK AREA TO ADD RECORDS INTO A INTERNAL TABLE

 wa_student1-name = 'Dinesh'.
 wa_student1-dob = '20050112'.
 wa_student1-class = '4th Year'.
 wa_student1-city = 'Warangal'.

 APPEND wa_student1 TO it_student1.

 CLEAR wa_student1." OR THE NEXT RECORD WILL REPLACE THE CURRENT ONE .

 wa_student1-name = 'Sai'.
 wa_student1-dob = '20050212'.
 wa_student1-class = '4th Year'.
 wa_student1-city = 'Thuni'.

 APPEND wa_student1 TO it_student1.

 out->write( data = it_student1
             name = 'Internal Table 1' ).

 out->write( data = it_student1
             name = 'Internal Table 1' ).

  ENDMETHOD.
ENDCLASS.
