*&---------------------------------------------------------------------*
*& Report ZMA_OPERANT_FOR
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zma_operant_for.

types: begin of ty_data,
         c1 type i,
         c2 type i,
         c3 type i,
         c4 type i,
       end of ty_data.

types: begin of ty_data4,
         c1 type i,
         c2 type i,
       end of ty_data4.


types: tt_data4 type table of ty_data4 with empty key.

types: tt_data type table of ty_data with empty key.

*--------------------------------------------------------------------*
* 1.Beispiel

data(it_data) = value tt_data( for i = 10 then i + 10 until i > 50
                                ( c1 = i c2 = i + 1 c3 = i + 2 c4 = i + 3 ) ).

cl_demo_output=>write( it_data ).


*--------------------------------------------------------------------*
* 2.Beispiel

data(it_data2) = value tt_data( for wa in it_data where ( c1 > 30 ) ( wa ) ).

cl_demo_output=>write( it_data2 ).


*--------------------------------------------------------------------*
* 3.Beispiel

data(it_data3) = value tt_data( for wa in it_data
                                index into lv_index
                                where ( c1 = 30 ) ( lines of it_data from lv_index ) ).

cl_demo_output=>write( it_data3 ).


*--------------------------------------------------------------------*
* 4.Beispiel

data(it_data4) = value tt_data4( for wa in it_data from 2 to 4 ( c1 = wa-c1 c2 = wa-c2 ) ).

cl_demo_output=>write( it_data4 ).


*--------------------------------------------------------------------*
* 5.Beispiel

types: tt_i type table of i with empty key.

data(it_data5) = value tt_i( for wa in it_data ( wa-c1 ) ( wa-c2 ) ).

cl_demo_output=>display( it_data5 ).
