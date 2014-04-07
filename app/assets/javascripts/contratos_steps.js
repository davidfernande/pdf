$(document).ready(function(){
	

        JSON.parse = null;

	
     var potencias = ["0.191",
					"0.200",
					"0.330",
					"0.345",
					"0.381",
					"0.399",
					"0.445",
					"0.466",
					"0.635",
					"0.660",
					"0.665",
					"0.690",
					"0.770",
					"0.805",
					"0.953",
					"0.998",
					"1.100",
					"1.150",
					"1.270",
					"1.330",
					"1.650",
					"1.725",
					"1.905",
					"1.995",
					"2.200",
					"2.300",
					"2.540",
					"2.660",
					"3.175",
					"3.300",
					"3.325",
					"3.450",
					"3.810",
					"3.990",
					"4.400",
					"4.445",
					"4.600",
					"4.655",
					"5.080",
					"5.320",
					"5.500",
					"5.715",
					"5.750",
					"5.985",
					"6.350",
					"6.600",
					"6.650",
					"6.900",
					"7.700",
					"8.050",
					"8.379",
					"8.800",
					"9.200",
					"9.900"];
  	 

    $( "#precontrato_datossuministro_potencia" ).autocomplete({
	source: function( request, response ) {
    			var matches = $.map( potencias, function(tag) {
		      if ( tag.toUpperCase().indexOf(request.term.toUpperCase()) === 0 ) {
		        return tag;
		      }
		    });
		    response(matches);
		  },   
      minLength: 1,
      change: function (event, ui) {
          var referenceValue = $(this).val();
          var matches = false;
          
          $(".ui-autocomplete li").each(function(){
          	  
              if( $(this).text()==referenceValue ){
                  matches = true;
                  return false;
              }
          });
      
          if(!matches){
              $(this).val('');
          }
      },
      select: function( event, ui ) {
        $( "#precontrato_datossuministro_potencia" ).val( ui.item.value );
        CalculateCuota();
        return false;
      }
      
    });


	






    $( "#precontrato_cliente_provincia" ).autocomplete({
	  source:function( request, response ) {
		$.ajax({
				url: "/contratos_steps/get_provincias",
				dataType: "json",
				dataFilter: function(data) { return data; },
				data: {
					provincia: request.term,
				},
				error: function (response) {
				      var r = jQuery.parseJSON(response.responseText);
				},
 				success: function( data ) {
					response( $.map( data, function( item ) {
					return {
							value: item
							}
					}));
				}							
				
			});
		},
      minLength: 1,
      change: function (event, ui) {
          var referenceValue = $(this).val();
          var matches = false;
          
          
          $(".ui-autocomplete li").each(function(){
              if( $(this).text()==referenceValue ){
                  matches = true;
                  return false;
              }
          });
      
          if(!matches){
              $(this).val('');
              //this.element.removeClass( "ui-autocomplete-loading" );
			$(this).tooltip( "open" );              
              
          } 
      },
      select: function( event, ui ) {
        $( "#precontrato_cliente_provincia" ).val( ui.item.value );
        return false;
      }
      
    });




    $( "#precontrato_cliente_municipio" ).autocomplete({
	  source:function( request, response ) {
		$.ajax({
				url: "/contratos_steps/get_municipios",
				dataType: "json",
				data: {
					municipio: request.term,
					provincia: $( "#precontrato_cliente_provincia" ).val()
				},
				error: function (response) {
				      var r = jQuery.parseJSON(response.responseText);
				},
 				success: function( data ) {
					response( $.map( data, function( item ) {
					return {
							value: item
							}
					}));
				}							
				
			});
		},
      minLength: 1,
      change: function (event, ui) {
          var referenceValue = $(this).val();
          var matches = false;
          
          
          $(".ui-autocomplete li").each(function(){
              if( $(this).text()==referenceValue ){
                  matches = true;
                  return false;
              }
          });
      
          if(!matches){
              $(this).val('');
              $( "#precontrato_cliente_codigopostal" ).val('');
          } else {
          	$( "#precontrato_cliente_codigopostal" ).val('');
          }
      },
      select: function( event, ui ) {
        $( "#precontrato_cliente_municipio" ).val( ui.item.value );
        $( "#precontrato_cliente_codigopostal" ).val('');
        return false;
      }
      
    });
 
     $( "#precontrato_cliente_codigopostal" ).autocomplete({
	  source:function( request, response ) {
		$.ajax({
				url: "/contratos_steps/get_codigopostal",
				dataType: "json",
				data: {
					codigopostal: request.term,
					provincia: $( "#precontrato_cliente_provincia" ).val(),
					municipio: $( "#precontrato_cliente_municipio" ).val(),
				},

				error: function (response) {
				      var r = jQuery.parseJSON(response.responseText);
				},
 				success: function( data ) {
					response( $.map( data, function( item ) {
					return {
							value: item
							}
					}));
				}							
				
			});
		},
      minLength: 1,
      change: function (event, ui) {
          var referenceValue = $(this).val();
          var matches = false;
          
          
          $(".ui-autocomplete li").each(function(){
              if( $(this).text()==referenceValue ){
                  matches = true;
                  return false;
              }
          });
      
          if(!matches){
              $(this).val('');
          }
      },
      select: function( event, ui ) {
        $( "#precontrato_cliente_codigopostal" ).val( ui.item.value );
        return false;
      }
      
    }); 

	checkIDS=function(field, rules, i, options){
		valor = checkNIF(field, rules, i, options);
		if (valor== false) {
			valor = checkNIE(field, rules, i, options);	
			if (valor== false) {
				valor == checkCIF(field, rules, i, options);	
				if (valor== false) {
					return "Por favor Introduzca un DNI, NIF, CIF o NIE válido"
				} else {
					return 
				}					
			} else {
				return 
			}		
		} else {
			return 
		}
		
		
	}
	
    checkNIF=function(field, rules, i, options){	  	
		 "use strict";
		 var value;
		 value = field.val();
		 value = value.toUpperCase();
		 
		 
		 // Basic format test
		 if ( !value.match('((^[A-Z]{1}[0-9]{7}[A-Z0-9]{1}$|^[T]{1}[A-Z0-9]{8}$)|^[0-9]{8}[A-Z]{1}$)') ) {
		  return false;
		 }
		 
		 // Test NIF
		 if ( /^[0-9]{8}[A-Z]{1}$/.test( value ) ) {
		  return ( "TRWAGMYFPDXBNJZSQVHLCKE".charAt( value.substring( 8, 0 ) % 23 ) === value.charAt( 8 ) );
		 }
		 // Test specials NIF (starts with K, L or M)
		 if ( /^[KLM]{1}/.test( value ) ) {
		  return ( value[ 8 ] === String.fromCharCode( 64 ) );
		 }
		 
		 return false;
		 
		};
		 
		 
    checkNIE=function(field, rules, i, options){	  	
		 "use strict";
		 var value;
		 value = field.val().toUpperCase();
		 		 
		 // Basic format test
		 if ( !value.match('((^[A-Z]{1}[0-9]{7}[A-Z0-9]{1}$|^[T]{1}[A-Z0-9]{8}$)|^[0-9]{8}[A-Z]{1}$)') ) {
		  return false;
		 }
		 
		 // Test NIE
		 //T
		 if ( /^[T]{1}/.test( value ) ) {
		  return ( value[ 8 ] === /^[T]{1}[A-Z0-9]{8}$/.test( value ) );
		 }
		 
		 //XYZ
		 if ( /^[XYZ]{1}/.test( value ) ) {
		  return (
		   value[ 8 ] === "TRWAGMYFPDXBNJZSQVHLCKE".charAt(
		    value.replace( 'X', '0' )
		     .replace( 'Y', '1' )
		     .replace( 'Z', '2' )
		     .substring( 0, 8 ) % 23
		   )
		  );
		 }
		 
		 return false;
		 
		};

    checkCIF=function(field, rules, i, options){	  	
		 "use strict";
		 var value;
		 var sum,
		  num = [],
		  controlDigit;
		  
		 value = field.val().toUpperCase();
		  
		 // Basic format test
		 if ( !value.match( '((^[A-Z]{1}[0-9]{7}[A-Z0-9]{1}$|^[T]{1}[A-Z0-9]{8}$)|^[0-9]{8}[A-Z]{1}$)' ) ) {
		  return false;
		 }
		  
		 for ( var i = 0; i < 9; i++ ) {
		  num[ i ] = parseInt( value.charAt( i ), 10 );
		 }
		  
		 // Algorithm for checking CIF codes
		 sum = num[ 2 ] + num[ 4 ] + num[ 6 ];
		 for ( var count = 1; count < 8; count += 2 ) {
		  var tmp = ( 2 * num[ count ] ).toString(),
		   secondDigit = tmp.charAt( 1 );
		   
		  sum += parseInt( tmp.charAt( 0 ), 10 ) + ( secondDigit === '' ? 0 : parseInt( secondDigit, 10 ) );
		 }
		  
		 // CIF test
		 if ( /^[ABCDEFGHJNPQRSUVW]{1}/.test( value ) ) {
		  sum += '';
		  controlDigit = 10 - parseInt( sum.charAt( sum.length - 1 ), 10 );
		  value += controlDigit;
		  return ( num[ 8 ].toString() === String.fromCharCode( 64 + controlDigit ) || num[ 8 ].toString() === value.charAt( value.length - 1 ) );
		 }
		  
		 return false;
		  
		};	  	
		
	validaCCC= function (field, rules, i, options){
		    var value = field.val();
		    value = value.replace(/-/g, '');
		    //alert (value)
		    var banco = value.substring(0,4);
		    var sucursal = value.substring(4,8);
		    var dc = value.substring(8,10);
		    var cuenta=value.substring(10,20);
		    var CCC = banco+sucursal+dc+cuenta;
		    if (!/^[0-9]{20}$/.test(banco+sucursal+dc+cuenta)){
		        return "Por favor Introduzca un número de cuenta válido";
		    }
		    else
		    {
		        valores = new Array(1, 2, 4, 8, 5, 10, 9, 7, 3, 6);
		        control = 0;
		        for (i=0; i<=9; i++)
		        control += parseInt(cuenta.charAt(i)) * valores[i];
		        control = 11 - (control % 11);
		        if (control == 11) control = 0;
		        else if (control == 10) control = 1;
		        if(control!=parseInt(dc.charAt(1))) {
		            return "Por favor Introduzca un número de cuenta válido";
		        }
		        control=0;
		        var zbs="00"+banco+sucursal;
		        for (i=0; i<=9; i++)
		            control += parseInt(zbs.charAt(i)) * valores[i];
		        control = 11 - (control % 11);
		        if (control == 11) control = 0;
		            else if (control == 10) control = 1;
		        if(control!=parseInt(dc.charAt(0))) {
		            return "Por favor Introduzca un número de cuenta válido";
		        }
		        return ;
		    }
		};    		
		
 
	  
    $("#form_id").validationEngine();
    
//    $(".formErrorContent").click(function(){
//		$('#form_id').validationEngine('hideAll');
//	});

    
    
//    $("#precontrato_suministro_cups").tooltip({
//			    	animation: true,
//			    	html:false,
//			    	placement:'right',
//			    	selector:false,
//			    	title: 'El CUPS es el código identificador de su instalación y figura en la cabecera de su factura',
//			    	trigger: 'hover focus',
//			    	delay: 0,
//			    	container: 'body'
//			    	});	

    $("#precontrato_suministro_cups").popover({
			    	animation: true,
			    	html:false,
			    	placement:'right',
			    	selector:false,
			    	title: 'CUPS',
			    	content: 'El CUPS es el código identificador de su instalación y figura en la cabecera de su factura',
			    	trigger: 'hover focus',
			    	delay: 0,
			    	container: 'body'
			    	});	


    $("#precontrato_datossuministro_potencia").popover({
			    	animation: true,
			    	html:false,
			    	placement:'right',
			    	selector:false,
			    	title: "Potencia contratada",
			    	content: 'La potencia contratada (kW) es un valor de su instalación y figura en la cabecera de su factura',
			    	trigger: 'hover focus',
			    	delay: 0,
			    	container: 'body'
			    	});	

    $("#precontrato_datossuministro_consumoestimado").popover({
			    	animation: true,
			    	html:false,
			    	placement:'right',
			    	selector:false,
			    	title: "Consumo estimado",
			    	content: 'El consumo estimado (kWh/mes) es un valor de su hogar y figura en la cabecera de su factura aunque dependiendo del tipo de factura podría ser bimensual y en este campo debe introducir el valor mensual',
			    	trigger: 'hover focus',
			    	delay: 0,
			    	container: 'body'
			    	});	
			    	
    $("#precontrato_CosteMensualAlquilerContador").popover({
			    	animation: true,
			    	html:false,
			    	placement:'right',
			    	selector:false,
			    	title: "Alquiler del contador",
			    	content: 'El coste de alquiler de su contador es una cantidad que cobra la empresa distribuidora y figura también en su factura, aunque su valor podría ser bimensual y en este campo debe introducir el valor mensual',
			    	trigger: 'hover focus',
			    	delay: 0,
			    	container: 'body'
			    	});	
			    	
    $("#precontrato_suministro_tarifa").popover({
			    	animation: true,
			    	html:false,
			    	placement:'right',
			    	selector:false,
			    	title: 'Tarifa',
			    	content: 'La tarifa o tipo de cliente que aplica Yelou!luz es 2.0A doméstico o para hogar',
			    	trigger: 'hover focus',
			    	delay: 0,
			    	container: 'body'
			    	});				    	    

    
      
 });
 

   function RellenaCampos()
		{
		  var cups= $('#precontrato_suministro_cups').val();
				var datosjson=$.ajax({
				dataType: "json",
				url: 'http://134.255.186.125/yelou/API/SIPS/BuscaCUPS',
					data: {
						cups: cups
					},
	 				success: function( data ) {					
						$('#precontrato_datossuministro_potencia').val(Number(Number(data.potP1.replace(',','.'))*1000).toFixed(3));					     
						$('#precontrato_datossuministro_consumoestimado').val(Number(Number(data.energiaActivaPeriodo1)/12).toFixed(0));
					}
				});	
				  

		}; 
 
   function CalculateCuota()
		{
		  var potencia= $('#precontrato_datossuministro_potencia').val();
		  var consumo= $('#precontrato_datossuministro_consumoestimado').val();
		  var contador= $('#precontrato_CosteMensualAlquilerContador').val();
          if ((potencia !== null) && (contador !== null) && (consumo !== null))
          {
				var datosjson=$.ajax({
				dataType: "json",
				url: 'http://134.255.186.125/yelou/API/Contrato/BuscaDesgloseCuotaFijaMensualPorPotenciaConsumoAlquiler',
					data: {
						potencia: potencia,
						consumoMensual: consumo,
						costeMensualAlquilerContador: contador
					},
	 				success: function( data ) {					
					  
						document.getElementById('CuotaTT').innerHTML=data.CuotaFijaMensual;						  
					   	document.getElementById('CuotaT').innerHTML=data.CuotaFijaMensual + ' euros al mes';	
					   	
					   	
						document.getElementById('TPT').innerHTML= Number(data.TerminoPotenciaMensual).toFixed(4)  ;
						
						document.getElementById('TERT').innerHTML= Number(data.TerminoEnergiaMensual).toFixed(4)  ;
						
						document.getElementById('TEYT1').innerHTML= Number(data.TerminoEnergiaYelouMensual).toFixed(4)  ;

						document.getElementById('TEYD2').innerHTML= data.DescuentoTerminoEnergiaYelouPorcentaje1 ;
						document.getElementById('TEYT2').innerHTML= Number((-1)  * data.TerminoEnergiaYelouMensual * data.DescuentoTerminoEnergiaYelouPorcentaje1 /100).toFixed(4)  ;

						//DescuentoTerminoEnergiaYelouVigenciaEnMeses1
						 
						document.getElementById('TEYD3').innerHTML= data.DescuentoTerminoEnergiaYelouPorcentaje2 ;
						document.getElementById('TEYT3').innerHTML= Number((-1)  * data.TerminoEnergiaYelouMensual * data.DescuentoTerminoEnergiaYelouPorcentaje2 /100).toFixed(4) ;
						
						//DescuentoTerminoEnergiaYelouResultado2
						
						document.getElementById('GST1').innerHTML= Number(data.GestionSolarMensual).toFixed(4)  ;
						
						document.getElementById('GST2').innerHTML= Number((-1)  * data.GestionSolarMensual * data.DescuentoGestionSolarMensualPorcentaje /100).toFixed(4) ;						
						
						document.getElementById('GSD').innerHTML= data.DescuentoGestionSolarMensualPorcentaje ;
						
						//data.DescuentoGestionSolarMensualResultado ;
						
						document.getElementById('ACT').innerHTML= Number(data.AlquilerContadorMensual).toFixed(4) ;
						
						document.getElementById('IEET').innerHTML= Number(data.SumaIEE).toFixed(4)  ;
						
						document.getElementById('IVA').innerHTML= Number(data.PorcentajeAplicadoIVA).toFixed(0) ;
						
						document.getElementById('IVAT').innerHTML= Number(data.SumaIVA).toFixed(4)  ;					   
							   
					   
					}
				});	
			}{
				
				document.getElementById('CuotaT').innerHTML='...';
				document.getElementById('CuotaTT').innerHTML='...';

			}	  

		};
		


