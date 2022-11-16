class ZCL_EWM_MATERIAL definition
  public
  final
  create public .

public section.

  class-methods READ_MATR
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_MATID type /SCWM/DE_MATID
    exporting
      !ES_MAT_GLOBAL type /SCWM/S_MATERIAL_GLOBAL
    exceptions
      ERROR .
protected section.
private section.
ENDCLASS.



CLASS ZCL_EWM_MATERIAL IMPLEMENTATION.


  METHOD read_matr.
* Read of the global product master attributes
    DATA: ls_mat_global TYPE /scwm/s_material_global.

    CLEAR es_mat_global.

* check input data
    IF iv_lgnum IS INITIAL
      OR iv_matid IS INITIAL.
      RETURN.
    ENDIF.

    TRY.
        CALL FUNCTION '/SCWM/MATERIAL_READ_SINGLE'
          EXPORTING
            iv_matid      = iv_matid
            iv_langu      = sy-langu
            iv_lgnum      = iv_lgnum
          IMPORTING
            es_mat_global = ls_mat_global.
      CATCH /scwm/cx_md.
        MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
          WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4 RAISING error.
    ENDTRY.

    es_mat_global = ls_mat_global.

  ENDMETHOD.
ENDCLASS.
