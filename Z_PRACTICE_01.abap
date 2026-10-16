
CLASS z_practice_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS z_practice_01 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    "==================================================
    " 1. BASIC DATA DECLARATIONS
    "==================================================

    DATA lv_name TYPE string.
    DATA lv_age  TYPE i.
    DATA lv_city TYPE string.

    lv_name = 'Vishwas'.
    lv_age  = 21.
    lv_city = 'Karimnagar'.

    out->write( '1. BASIC DATA DECLARATIONS' ).
    out->write( data = lv_name name = 'Name' ).
    out->write( data = lv_age  name = 'Age' ).
    out->write( data = lv_city name = 'City' ).


    "==================================================
    " 2. ELEMENTARY DATA TYPES
    "==================================================

    DATA lv_char      TYPE c LENGTH 10." Characters of Length 10.
    DATA lv_numc      TYPE n LENGTH 5."Numeric Text of Length 5.
    DATA lv_date      TYPE d." Date in 'yyyymmdd' format.
    DATA lv_time      TYPE t." Time in 'hhmmss' format
    DATA lv_integer   TYPE i." Integer.
    DATA lv_int8      TYPE int8." Integer upto 8 bytes.
    DATA lv_packed    TYPE p LENGTH 8 DECIMALS 2. " Text Numeric with decimals .
    DATA lv_float     TYPE f." Number with decimal.
    DATA lv_decimal16 TYPE decfloat16.
    DATA lv_decimal34 TYPE decfloat34.
    DATA lv_text      TYPE string." Long text .

    lv_char      = 'ABAP'.
    lv_numc      = '00123'.
    lv_date      = '20261015'.
    lv_time      = '164500'.
    lv_integer   = 100.
    lv_int8      = 10000000000.
    lv_packed    = '12500.50'.
    lv_float     = '12.5'.
    lv_decimal16 = '123.45'.
    lv_decimal34 = '123456789.123456789'.
    lv_text      = 'Modern ABAP'.

    "==================================================
    " 3. CONSTANTS
    "==================================================

    CONSTANTS lc_country TYPE string VALUE 'India'.
    CONSTANTS lc_pi      TYPE decfloat16 VALUE '3.14159'.

    out->write( '3. CONSTANTS' ).
    out->write( data = lc_country name = 'Country' ).
    out->write( data = lc_pi      name = 'PI' ).


    "==================================================
    " 4. INLINE DECLARATION AND TYPE INFERENCE
    "==================================================

    DATA(lv_marks) = 90. "Here lv_marks is a INLINE Variable 
    DATA(lv_student) = `Vishwas`.
    DATA(lv_percentage) = CONV decfloat34( '89.75' ). 

    out->write( '4. INLINE DECLARATIONS' ).
    out->write( data = lv_marks      name = 'Marks' ).
    out->write( data = lv_student    name = 'Student' ).
    out->write( data = lv_percentage name = 'Percentage' ).


    "==================================================
    " 5. STRING TEMPLATES
    "==================================================

    DATA(lv_message) =
      |My name is { lv_name }, I am { lv_age } years old.|." We can write variables in text 

    out->write( lv_message ).


    "==================================================
    " 6. ARITHMETIC OPERATIONS
    "==================================================

    DATA lv_a      TYPE i VALUE 20.
    DATA lv_b      TYPE i VALUE 10.
    DATA lv_result TYPE i.

    lv_result = lv_a + lv_b.
    out->write( data = lv_result name = 'Addition' ).

    lv_result = lv_a - lv_b.
    out->write( data = lv_result name = 'Subtraction' ).

    lv_result = lv_a * lv_b.
    out->write( data = lv_result name = 'Multiplication' ).

    lv_result = lv_a / lv_b.
    out->write( data = lv_result name = 'Division' ).




    "==================================================
    " 7. CONVERSION OPERATORS
    "==================================================

    DATA(lv_age_text) = CONV string( lv_age ). 

    DATA(lv_number) = CONV i( '250' ).

    out->write( data = lv_age_text name = 'Age as Text' ).
    out->write( data = lv_number   name = 'Converted Integer' ).


    "==================================================
    " 8. REFERENCE VARIABLES
    "==================================================

    DATA lr_name TYPE REF TO string.

    CREATE DATA lr_name.

    lr_name->* = 'Vishwas Rao'.

    out->write( data = lr_name->* name = 'Referenced Value' ).




    "==================================================
    " 9. SYSTEM FIELDS
    "==================================================

    out->write( data = sy-uname name = 'Current User' ).
    out->write( data = sy-datum name = 'Current Date' ).
    out->write( data = sy-uzeit name = 'Current Time' ).


 

  ENDMETHOD.

ENDCLASS.
