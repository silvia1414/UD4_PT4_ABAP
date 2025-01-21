CLASS zcl_main_smp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    CLASS-METHODS: main.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_main_smp IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    me->main( ). " Llamada al método principal
  ENDMETHOD.

  METHOD main.
    DATA: lo_customer_manager TYPE REF TO zcl_customer_manager_smp,
          lv_check_code TYPE sy-subrc.

    " Crear una instancia de la clase customer manager
    CREATE OBJECT lo_customer_manager.

    " Insertar 4 nuevos registros
    lo_customer_manager->add_customer(
      EXPORTING
        customer_id     = 'C001'
        customer_name   = 'John Doe'
        customer_activo = 'X'
      IMPORTING
        check_code      = lv_check_code ).

    lo_customer_manager->add_customer(
      EXPORTING
        customer_id     = 'C002'
        customer_name   = 'Jane Smith'
        customer_activo = 'X'
      IMPORTING
        check_code      = lv_check_code ).

    lo_customer_manager->add_customer(
      EXPORTING
        customer_id     = 'C003'
        customer_name   = 'Bob Brown'
        customer_activo = ' '
      IMPORTING
        check_code      = lv_check_code ).

    lo_customer_manager->add_customer(
      EXPORTING
        customer_id     = 'C004'
        customer_name   = 'Williams'
        customer_activo = 'X'
      IMPORTING
        check_code      = lv_check_code ).

    " Modificar algunos registros
    lo_customer_manager->update_customer(
      EXPORTING
        customer_id     = 'C002'
        customer_name   = 'Jane Doe'
        customer_activo = ' '
      IMPORTING
        check_code      = lv_check_code ).

    lo_customer_manager->update_customer(
      EXPORTING
        customer_id     = 'C003'
        customer_name   = 'Williams'
        customer_activo = 'X'
      IMPORTING
        check_code      = lv_check_code ).

    " Eliminar un registro
    lo_customer_manager->delete_customer(
      EXPORTING
        customer_id = 'C004'
      IMPORTING
        check_code = lv_check_code ).

  ENDMETHOD.

ENDCLASS.

