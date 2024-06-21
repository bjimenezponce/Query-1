DECLARE
    v_run      NUMBER(8);
    v_nombre VARCHAR2 (50);
    v_sueldo   NUMBER(8);
    v_sueldo_bono number (10);
    v_dv_run number (1); // siempre varchar2
    v_bono number (8);
    valor_porcentaje number (3);
    
    
   
    
BEGIN SELECT
          med_run,
          dv_run,
          INITCAP( pnombre ||' '|| aparterno ||' '|| amaterno ),
          sueldo_base 
	  
      INTO
          v_run,
          v_dv_run,
          v_nombre, 
          v_sueldo
          
      FROM
          medico
    WHERE 
        med_run = &RUN and sueldo_base < 1000000;
        
        
        v_porcentaje:= &valor_porcentaje;
        v_bono := v_sueldo * trunc (v_porcentaje/100);
        v_sueldo_bono := v_sueldo + trunc ( v_sueldo *(v_porcentaje/100)); 
        
            
            

    dbms_output.put_line('datos calculo bonificacion del '|| v_porcentaje || '%'|| 'del sueldo');
    dbms_output.put_line('---------------------------------------------');
    dbms_output.put_line(' ');
    dbms_output.put_line('RUN Medico : ' ||  v_run || '-' || v_dv_run);
    dbms_output.put_line('Nombre Medico: '|| v_nombre );
    dbms_output.put_line('Sueldo : ' || trim (to_char( v_sueldo, '$9g999g999')));
    dbms_output.put_line('bonificacion extra : ' || trim (to_char( v_bono, '$9g999g999')));
    dbms_output.put_line('Sueldo final : ' || trim (to_char( v_sueldo_bono, '$9g999g999')));
    
    
    
END;