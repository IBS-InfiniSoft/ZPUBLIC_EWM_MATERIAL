*&---------------------------------------------------------------------*
*& Include          ZEWM_MATERIAL_C01
*&---------------------------------------------------------------------*
CLASS lcl_demo DEFINITION FINAL.
  PUBLIC SECTION.
    CLASS-METHODS:
      main
        IMPORTING iv_lgnum TYPE /scwm/lgnum
                  iv_matid TYPE /scwm/de_matid.
ENDCLASS.

CLASS lcl_demo IMPLEMENTATION.
  METHOD main.

    zcl_ewm_material=>read_matr(
      EXPORTING
        iv_lgnum      = iv_lgnum
        iv_matid      = iv_matid
      IMPORTING
        es_mat_global = DATA(ls_mat_global)
      EXCEPTIONS
        error         = 1
        OTHERS        = 2 ).
    IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
        WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
      RETURN.
    ENDIF.

    cl_demo_output=>display_data( ls_mat_global ).

  ENDMETHOD.
ENDCLASS.
