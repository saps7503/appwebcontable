$(document).ready(function () {
    /*var window_height = $(window).height();
    var content_height = $('#contenido').height();
    var footer_height = $('#footer').height();
    margin_footer = window_height - content_height;
    if (content_height < window_height) {
        margin_footer = window_height - footer_height -50;
        $('#footer').css('margin-top', margin_footer);
    }*/
  


  
    
    $('.creaBanco').click(function () {
        type = $(this).attr('data-type');

        $('.overlay-container-bank').fadeIn(function () {

            window.setTimeout(function () {
                $('.window-container-bank.' + type).addClass('window-container-visible');
            }, 100);

        });
    });
    $('.close-bank').click(function () {
        $('.overlay-container-bank').fadeOut().end().find('.window-container-bank').removeClass('window-container-visible');
        $("#nameBanco").val('');
    });
    $('.close').click(function () {
        $('.overlay-container').fadeOut().end().find('.window-container').removeClass('window-container-visible');
    });
    $('.close').click(function () {
        $('.overlay-container-pack').fadeOut().end().find('.window-container-pack').removeClass('window-container-visible');
    });
    $('.close').click(function () {
        $('.overlay-container-tour').fadeOut().end().find('.window-container-tour').removeClass('window-container-visible');
    });



    $("#nuevoBanco").submit(function (event) {
        event.preventDefault();
        $.ajax({
            url: 'crearBanco',
            type: 'post',
            dataType: 'json',
            data: {banco: $("#nameBanco").val()}
        }).done(function (respuesta) {
            
            if (!respuesta.existe) {
                alert("Registrado");
                $('.overlay-container-bank').fadeOut().end().find('.window-container-bank').removeClass('window-container-visible');
                $("#nameBanco").val('');
                $("#bancos").html('');
                var html = "";
                for (index = 0; index < respuesta.length; ++index) {
                    html += "<option value='" + respuesta[index].nombre + "'>" + respuesta[index].nombre + "</option>";
                }
                $("#bancos").html(html);
            } else {
                alert("El banco ya esta registrado");
            }

        });
    });
    
    /*$("#formLogIn").submit(function (event) {
        event.preventDefault();
        $.ajax({
            url: 'Home/LogIn',
            type: 'post',
            dataType: 'json',
            data: { email: $("#txtEmail").val(), password: $("#txtPassword").val() }
        }).done(function (respuesta) {
            if (respuesta.autorized == false) {
                alert('E-mail y/o Contraseña Incorrectos');
            } else {
                if (respuesta[0].rol == "contador") {
                    location.href = 'Home/Contador';
                } else if (respuesta[0].rol == "administrador") {
                    location.href = 'Home/Administrador';
                } else if (respuesta[0].rol == "agente de ventas") {
                    location.href = 'Home/AgenteVentas';
                }
            }
        });
    });*/
    $("#formLogIn").submit(function (event) {
        event.preventDefault();
        $.ajax({
            url: 'contabilidad/Home/LogIn',
            type: 'post',
            dataType: 'json',
            data: { email: $("#txtEmail").val(), password: $("#txtPassword").val() }
        }).done(function (respuesta) {
            if (respuesta.autorized == false) {
                alert('E-mail y/o Contraseña Incorrectos');
            } else {
                if (respuesta[0].rol == "contador") {
                    location.href = 'contabilidad/Home/Contador';
                } else if (respuesta[0].rol == "administrador") {
                    location.href = 'contabilidad/Home/Administrador';
                } else if (respuesta[0].rol == "agente de ventas") {
                    location.href = 'contabilidad/Home/AgenteVentas';
                }
            }
        });
    });

    $("#form-paquete").submit(function (event) {
        event.preventDefault();
        $.ajax({
            url: 'Registrar',
            type: 'post',
            dataType: 'json',
            data: {
                paquete: $("#paquete").val(),
                precioalta: $("#precioalta").val(),
                preciobaja: $("#preciobaja").val(),
                dias: $("#dias").val(),
                incluye: CKEDITOR.instances['incluye'].getData(),
                itinerario: CKEDITOR.instances['itinerario'].getData()
            }
        }).done(function (respuesta) {
            if (respuesta.success) {
                $("#paquete").val('');
                $("#precio").val('');
                $("#dias").val('');
                CKEDITOR.instances['incluye'].setData('');
                CKEDITOR.instances['itinerario'].setData('');
                alert("Guardado");
            }
        });
    });
    $("#form-paquete-editar").submit(function (event) {
        event.preventDefault();
        $.ajax({
            url: 'actualizarPaquete',
            type: 'post',
            dataType: 'json',
            data: {
                id: $("#idpaquete").val(),
                paquete: $("#paquete").val(),
                precioalta: $("#precioalta").val(),
                preciobaja: $("#preciobaja").val(),
                dias: $("#dias").val(),
                incluye: CKEDITOR.instances['incluye'].getData(),
                itinerario: CKEDITOR.instances['itinerario'].getData()
            }
        }).done(function (respuesta) {
            if (respuesta.success) {
                alert("Guardado");
                location.href = "VerPaquetes";
            }
        });
    });

    $("#form-tour").submit(function (event) {
        event.preventDefault();
        $.ajax({
            url: 'RegistrarTour',
            type: 'post',
            dataType: 'json',
            data: {
                tour: $("#tour").val(),
                salida: $("#sale").val(),
                descripcion: CKEDITOR.instances['descripcion'].getData(),
                horasalida: $("#horasalida").val(),
                horaregreso: $("#horaregreso").val(),
                duracion: $("#duracion").val() + " Hrs",
                costoalta: $("#costoalta").val(),
                costobaja: $("#costobaja").val()
            }
        }).done(function (respuesta) {
            if (respuesta.success) {
                $("#tour").val('');
                $("#sale").val('');
                CKEDITOR.instances['descripcion'].setData('');
                $("#duracion").val('');
                $("#costoalta").val('');
                $("#costobaja").val('');
                $(".editor").html('');
                alert("Guardado");
            }

        });
    });

    $("#form-tour-editar").submit(function (event) {
        event.preventDefault();
        $.ajax({
            url: 'actualizarTour',
            type: 'post',
            dataType: 'json',
            data: {
                id: $("#idtour").val(),
                tour: $("#tour").val(),
                salida: $("#sale").val(),
                descripcion: CKEDITOR.instances['descripcion'].getData(),
                horasalida: $("#horasalida").val(),
                horaregreso: $("#horaregreso").val(),
                duracion: $("#duracion").val() + " Hrs",
                costoalta: $("#costoalta").val(),
                costobaja: $("#costobaja").val()
            }
        }).done(function (respuesta) {
            if (respuesta.success) {
                alert("Guardado");
                location.href = "VerTours";
            }

        });
    });

    $("#form-venta").submit(function (event) {
        event.preventDefault();
        $.ajax({
            url: 'registrarVenta',
            type: 'post',
            dataType: 'json',
            data: {
                cliente: $("#cliente").val(),
                fechaInicio: $("#inicio").val(),
                fechaFinal: $("#final").val(),
                correo: $("#correo").val(),
                telefono: $("#telefono").val(),
                tipoServicio: $("#tiposervicio").val(),
                nombreServicio: $("#nombreservicio").val(),
                tipoPago: $("#pago").val(),
                total: $("#total").val(),
                anticipo: $("#anticipo").val(),
                saldo: $("#saldo").val(),
                referencia: $("#referencia").val(),
                comentarios: $("#comentarios").val()
            }
        }).done(function (respuesta) {
            if (respuesta.success) {
                $("#cliente").val('');
                $("#correo").val('');
                $("#telefono").val('');
                $("#tiposervicio").val('');
                $("#nombreservicio").val('');
                $("#total").val('');
                $("#anticipo").val('');
                $("#saldo").val('');
                $("#referencia").val('');
                $("#comentarios").val('');
                alert("Guardado");
            }

        });
    });

    $("#form-cuenta").submit(function (event) {
        event.preventDefault();
        $.ajax({
            url: 'RegistrarCuenta',
            type: 'post',
            dataType: 'json',
            data: {
                banco: $("#bancos").val(),
                alias: $("#alias").val(),
                numerocuenta: $("#numeroCuenta").val(),
                cantidad: $("#cantidad").val(),
            }
        }).done(function (respuesta) {
            if (respuesta.success) {
                $("#alias").val('');
                $("#numeroCuenta").val('');
                $("#cantidad").val('');
                alert("Guardado");
            }

        });
    });

    $("#form-movimiento").submit(function (event) {
        event.preventDefault();
        var tr = $("#transaccion").val();
        var depositos = 0;
        var retiros = 0;
        if (tr == "Deposito") {
            depositos = $("#cantidad").val();
        } else {
            retiros = $("#cantidad").val();
        }
        $.ajax({
            url: 'Registrar',
            type: 'post',
            dataType: 'json',
            data: {
                cuenta: $("#cuenta").val(),
                fecha: $("#fecha").val(),
                descripcion: $("#descripcion").val(),
                referencia: $("#referencia").val(),
                autorizacion: $("#autorizacion").val(),
                concepto: $("#concepto").val(),
                deposito: depositos,
                retiro: retiros
            }
        }).done(function (respuesta) {
            if (respuesta.success) {
                $("#descripcion").val('');
                $("#referencia").val('');
                $("#autorizacion").val('');
                $("#concepto").val('');
                $("#cantidad").val('');
                alert("Guardado");
            }
        });
    });

    $("#form-usuario").submit(function (event) {
        event.preventDefault();
        $.ajax({
            url: 'Registrar',
            type: 'post',
            dataType: 'json',
            data: {
                nombre: $("#nombre").val(),
                apellidos: $("#apellidos").val(),
                telefono: $("#telefono").val(),
                email: $("#email").val(),
                password: $("#password").val(),
                rol: $("#rol").val(),
                comision: $("#comision").val(),
                temporada: $("#temporada").val()
            }
        }).done(function (respuesta) {
            if (respuesta.success) {
                $("#nombre").val('');
                $("#apellidos").val('');
                $("#telefono").val('');
                $("#email").val('');
                $("#password").val('');
                $("#comision").val(0);
                alert("Guardado");
            }

        });
    });


    $("#form-cotizacion").submit(function (event) {
        event.preventDefault();
        var cliente = $("#cliente").val();
        var direccion = $("#direccion").val();
        var correo = $("#correo").val();
        var mensaje = CKEDITOR.instances['mensaje'].getData();
        $.ajax({
            url: 'crearCotizacion',
            type: 'post',
            dataType: 'json',
            data: { cliente: cliente,direccion:direccion,correo:correo,mensaje:mensaje}
        }).done(function (respuesta) {
            if (respuesta.success) {
                alert("Cotización Enviada y Guardada");
                $("#cliente").val('');
                $("#direccion").val('');
                $("#correo").val('');
                CKEDITOR.instances['mensaje'].setData('');
            }
        });
    });



    $('#titleFecha').dblclick(function () {
        $('#titleFecha').hide();
        $('#sFecha').fadeIn();
    });
    $('#titleDescripcion').dblclick(function () {
        $('#titleDescripcion').hide();
        $('#sDescripcion').fadeIn();
    });
    $('#titleDeposito').dblclick(function () {
        $('#titleDeposito').hide();
        $('#sDeposito').fadeIn();
    });
    $('#titleRetiro').dblclick(function () {
        $('#titleRetiro').hide();
        $('#sRetiro').fadeIn();
    });
    $('#titleSaldo').dblclick(function () {
        $('#titleSaldo').hide();
        $('#sSaldo').fadeIn();
    });

    $(".search").keyup(function () {
        var fecha = $("#sFecha").val();
        var descripcion = $("#sDescripcion").val();
        var retiro = $("#sRetiro").val();
        var deposito = $("#sDeposito").val();
        var saldo = $("#sSaldo").val();
        var cuenta = $('#cuenta').val();
        $.ajax({
            url: "Filter", data: {
                fecha: fecha, descripcion: descripcion,
            retiro: retiro,deposito: deposito,saldo: saldo,idCuenta:cuenta}, type: "POST", dataType: "json", success: function (result) {
                $('#tbodyMov').html('');
                if (result.length > 0) {
                    for (i = 0; i < result.length; i++) {
                        var th = '<tr><th>' + result[i].fecha + '</th><th>' + result[i].descripcion + '</th><th>' + result[i].deposito + ' MXN$</th><th>' + result[i].retiro + ' MXN$</th>' +
                            '<th>' + result[i].saldoMXM + ' MXN$</th><th><input class="btn btn-success detalles" onclick="ver(' + result[i].id + ')" type="button" value="Detalles" /></th></tr>';
                        $('#tbodyMov').append(th);
                    }
                } else {
                    $('#tbodyMov').html('<tr><th colspan="6" >No hay coincidencias</th></tr>');
                }
            }
        });
    });

    $(".searchGral").keyup(function () {
        var v = $('#sGral').val();
        var cuenta = $('#cuenta').val();
        $.ajax({
            url: "FilterGral", data: {gral: v,idCuenta: cuenta}, type: "POST", dataType: "json", success: function (result) {
                $('#tbodyMov').html('');
                if (result.length > 0) {
                    for (i = 0; i < result.length; i++) {
                        var th = '<tr><th>' + result[i].fecha + '</th><th>' + result[i].descripcion + '</th><th>' + result[i].deposito + ' MXN$</th><th>' + result[i].retiro + ' MXN$</th>' +
                            '<th>' + result[i].saldoMXM + ' MXN$</th><th><input class="btn btn-success detalles" onclick="ver(' + result[i].id + ')" type="button" value="Detalles" /></th></tr>';
                        $('#tbodyMov').append(th);
                    }
                } else {
                    $('#tbodyMov').html('<tr><th colspan="6" >No hay coincidencias</th></tr>');
                }
            }
        });
    });

    $(".searchPack").keyup(function () {
        var v = $('#searchPack').val();
        var t = $("#tempo-hide").val();
        $.ajax({
            url: "FilterAdmin", data: { palabra: v }, type: "POST", dataType: "json", success: function (result) {
                $('#tbodyPack').html('');
                if (result.length > 0) {
                    for (i = 0; i < result.length; i++) {
                        var costo = 0;
                        if (t == 1) {
                            costo = result[i].costo_alta;
                        } else {
                            costo = result[i].costo_baja;
                        }
                        var th = '<tr><th>' + result[i].nombre + '</th><th>' + costo + '</th><th>' + result[i].dias + '</th><th><input class="btn btn-primary detalles" onclick="verPaquete(' + result[i].id + ')" type="button" value="Detalles" />';

                        if (result[i].estatus == 1) {
                            th += '   <input class="btn btn-success" onclick="disablePaquete(' + result[i].id + ')" type="button" value="Activo" />';
                        } else {
                            th += '   <input class="btn btn-danger" onclick="enablePaquete(' + result[i].id + ')" type="button" value="Inactivo" />';
                        }
                        th += '   <a class="btn btn-warning" href="EditarPaquete?idPaquete=' + result[i].id + '">Editar</a></th></tr>';
                        $('#tbodyPack').append(th);
                    }
                } else {
                    $('#tbodyPack').html('<tr><th colspan="6" >No hay coincidencias</th></tr>');
                }
            }
        });
    });

    $(".searchTour").keyup(function () {
        var v = $('#searchTour').val();
        var t = $("#tempo-hide").val();
        $.ajax({
            url: "FilterTourAdmin", data: { palabra: v }, type: "POST", dataType: "json", success: function (result) {
                $('#tbodyTour').html('');
                if (result.length > 0) {
                    for (i = 0; i < result.length; i++) {
                        var costo = 0;
                        if (t == 1) {
                            costo = result[i].costo_alta;
                        } else {
                            costo = result[i].costo_baja;
                        }
                        var th = '<tr><th>' + result[i].tour + '</th><th>' + costo + '</th><th><input class="btn btn-primary detalles" onclick="verTour(' + result[i].id_tour + ')" type="button" value="Detalles" />';
                        if (result[i].estatus == 1) {
                            th += '   <input class="btn btn-success" onclick="disableTour(' + result[i].id_tour + ')" type="button" value="Activo" />';
                        } else {
                            th += '   <input class="btn btn-danger" onclick="enableTour(' + result[i].id_tour + ')" type="button" value="Inactivo" />';
                        }
                        th += '   <a class="btn btn-warning" href="EditarTour?idTour=' + result[i].id_tour + '">Editar</a></th></tr>';
                        $('#tbodyTour').append(th);
                    }
                } else {
                    $('#tbodyTour').html('<tr><th colspan="6" >No hay coincidencias</th></tr>');
                }
            }
        });
    });

    $("#total").keyup(function () {
        var total = $("#total").val();
        if (total.trim().length > 0) {
            var anticipo = $("#anticipo").val();
            if (anticipo.trim().length > 0) {
                var suma = 0;
                if (parseFloat(total) > parseFloat(anticipo)) {
                    suma = total - anticipo;
                    $("#saldo").val(suma);
                } else {
                    $("#saldo").val(suma);
                }
            }
        } else {
            $("#saldo").val('');
        }
    });
    $("#anticipo").keyup(function () {
        var anticipo = $("#anticipo").val();
        if (anticipo.trim().length > 0) {
            var total = $("#total").val();
            if (total.trim().length > 0) {
                var suma = 0;
                if (parseFloat(total) > parseFloat(anticipo)) {
                    suma = total - anticipo;
                    $("#saldo").val(suma);
                } else {
                    $("#saldo").val(suma);
                }
            }
        } else {
            $("#saldo").val('');
        }
    });

});

function ver(id) {

    $.ajax({
        url: "dataMovimiento",data:{ID:id}, type: "POST",dataType:"json", success: function (result) {
            
            $('#fechaM').html(result[0].fecha);
            $('#porM').html(result[0].nombre + " " + result[0].apellidos);
            $('#desM').html(result[0].descripcion);
            $('#refM').html(result[0].referencia);
            $('#autoM').html(result[0].autorizacion);
            $('#concepM').html(result[0].concepto);
            $('#banM').html(result[0].banco);
            $('#ctaM').html(result[0].numeroCuenta);
            $('#depM').html(result[0].deposito + " MXN$");
            $('#retM').html(result[0].retiro + " MXN$");
            $('#saldoM').html(result[0].saldoMXM + " MXN$");
            $('#modM').html(result[0].fechaModificacion);
        }
    });

    type = $(this).attr('data-type');

    $('.overlay-container').fadeIn(function () {

        window.setTimeout(function () {
            $('.window-container.' + type).addClass('window-container-visible');
        }, 100);

    });
}

function verVenta(id) {
    $.ajax({
        url: "dataVenta", data: { ID: id }, type: "POST", dataType: "json", success: function (result) {

            $('#clienteM').html(result[0].cliente);
            $('#correoM').html(result[0].correo);
            $('#telefonoM').html(result[0].telefono);
            $('#servicioM').html(result[0].tipoServicio);
            $('#nombreM').html(result[0].nombreServicio);
            $('#tipopagoM').html(result[0].tipoPago);
            if (result[0].tipoServicio == "Paquete" || result[0].tipoServicio == "paquete") {
                $("#abarcaM").html(result[0].fechaInicial + '  a  ' + result[0].fechaFinal);
            }else{
                $("#abarcaM").html(result[0].fechaInicial);
            }
            
            $('#totalM').html(result[0].total);
            $('#anticipoM').html(result[0].anticipo);
            $('#saldoM').html(result[0].saldo);
            $('#referenciaM').html(result[0].referencia);
            $('#fechaM').html(result[0].fechaRegistro);
            $('#statusM').html(result[0].status);
            $('#comentariosM').html(result[0].comentarios);
        }
    });
    type = $(this).attr('data-type');

    $('.overlay-container').fadeIn(function () {

        window.setTimeout(function () {
            $('.window-container.' + type).addClass('window-container-visible');
        }, 100);

    });
}

function selectCompra(nameService, precio, tiposervice) {
    $('#tiposervicio').val(tiposervice);
    $('#nombreservicio').val(nameService);
    $('#total').val(precio);
}

function selectService(x,t) {
    if (x == 1) {
        $.ajax({
            url: "Filter", data: { palabra: "" }, type: "POST", dataType: "json", success: function (result) {
                $('#tbodyVenta').html('');
                if (result.length > 0) {
                    for (i = 0; i < result.length; i++) {
                        var costo = 0;
                        if (t == 1) {
                            costo = result[i].costo_alta;
                        } else {
                            costo = result[i].costo_baja;
                        }
                        var tr = $('<tr/>', { html: "<th>" + result[i].nombre + "</th><th>" + costo + "</th><th><input class='btn btn-success detalles' onclick='verPaquete(" + result[i].id + ")' type='button' value='Detalles' /></th>", onclick: 'selectCompra("' + result[i].nombre + '","' + costo + '","Paquete")' });
                        
                        $('#tbodyVenta').append(tr);
                    }
                } else {
                    $('#tbodyVenta').html('<tr><th colspan="3" >No hay Paquetes</th></tr>');
                }
            }
        });
    } else {
        $.ajax({
            url: "FilterTour", data: { palabra: "" }, type: "POST", dataType: "json", success: function (result) {
                $('#tbodyVenta').html('');
                if (result.length > 0) {
                    for (i = 0; i < result.length; i++) {
                        var costo = 0;
                        if (t == 1) {
                            costo = result[i].costo_alta;
                        } else {
                            costo = result[i].costo_baja;
                        }
                        var tr = $('<tr/>', { html: "<th>" + result[i].tour + "</th><th>" + costo + "</th><th><input class='btn btn-success detalles' onclick='verTour(" + result[i].id_tour + ")' type='button' value='Detalles' /></th>", onclick: 'selectCompra("' + result[i].tour + '","' + costo + '","Tour")' });
                        $('#tbodyVenta').append(tr);
                    }
                } else {
                    $('#tbodyVenta').html('<tr><th colspan="3" >No hay Tours</th></tr>');
                }
            }
        });
    }
}

function verCuentasMov(idCuenta) {
    $.ajax({
        url: "verCuentasMov", data: { id: idCuenta }, type: "POST", dataType: "json", success: function (result) {
            $('#tbodyMov').html('');
            if (result.length > 0) {
                for (i = 0; i < result.length; i++) {
                    var th = '<tr><th>' + result[i].fecha + '</th><th>' + result[i].descripcion + '</th><th>' + result[i].deposito + ' MXN$</th><th>' + result[i].retiro + ' MXN$</th>' +
                        '<th>' + result[i].saldoMXM + ' MXN$</th><th><input class="btn btn-success detalles" onclick="ver(' + result[i].id + ')" type="button" value="Detalles" /></th></tr>';
                    $('#tbodyMov').append(th);
                }
            } else {
                $('#tbodyMov').html('<tr><th colspan="6" >No hay Transacciones</th></tr>');
            }
        }
    });
}
function verCuentaMovDia(id) {
    $.ajax({
        url: "verCuentasMovDia", data: { id: id }, type: "POST", dataType: "json", success: function (result) {
            $('#tbodyMov').html('');
            if (result.length > 0) {
                for (i = 0; i < result.length; i++) {
                    var th = '<tr><th>' + result[i].descripcion + '</th><th>' + result[i].deposito + ' MXN$</th><th>' + result[i].retiro + ' MXN$</th>' +
                        '<th>' + result[i].saldoMXM + ' MXN$</th></tr>';
                    $('#tbodyMov').append(th);
                }
            } else {
                $('#tbodyMov').html('<tr><th colspan="6" >No hay Transacciones</th></tr>');
            }
        }
    });
}



function addInputComision(ref) {
    if (ref != "contador") {
        $(".comision-user").toggle(200);
    } else {
        $(".comision-user").toggle(200);
        $("#comision").val(0);
    }
}


function VentasPorFecha(fecha) {
    $.ajax({
        url: "verVentasDia", data: { fecha: fecha }, type: "POST", dataType: "json", success: function (result) {
            $('#tbodyVentas').html('');
            if (result.ventas.length > 0) {
                for (i = 0; i < result.ventas.length; i++) {
                    var th = '<tr><th>' + result.ventas[i].cliente + '</th><th>' + result.ventas[i].tipoServicio + '</th><th>' + result.ventas[i].nombreServicio + '</th><th>' + result.ventas[i].total + ' MXN$</th>' +
                        '<th>' + result.ventas[i].status + '</th><th><input class="btn btn-success detalles" onclick="verVenta(' + result.ventas[i].id + ')" type="button" value="Detalles" /></th></tr>';
                    $('#tbodyVentas').append(th);
                }
                $("#totalCotizacion").html('Cotizaciones al Día: ' + result.cant);
                $("#totalVentas").html('Ventas al Día: ' + result.cantVentas);
                $("#totalPesos").html('Total al Día: ' + result.total + ' MXN$');
            } else {
                $("#totalCotizacion").html('Cotizaciones al Día: ' + result.cant);
                $("#totalVentas").html('Ventas al Día: ' + result.cantVentas);
                $("#totalPesos").html('Total al Día: ' + result.total + ' MXN$');
                $('#tbodyVentas').html('<tr><th colspan="6" >No hay Ventas</th></tr>');
            }
        }
    });
}
function CotizacionPorFecha(fecha) {
    $.ajax({
        url: "verCotizacionDia", data: { fecha: fecha }, type: "POST", dataType: "json", success: function (result) {
            $('#tbodyCotizacion').html('');
            if (result.length > 0) {
                for (i = 0; i < result.length; i++) {
                    var th = '<tr><th>' + result[i].cliente + '</th><th>' + result[i].clienteCorreo + '</th><th>' + result[i].direccion +'</th><th><input class="btn btn-success detalles" onclick="verCotizacion(' + result[i].id + ')" type="button" value="Detalles" /></th></tr>';
                    $('#tbodyCotizacion').append(th);
                }
            } else {
                $('#tbodyCotizacion').html('<tr><th colspan="6" >No hay Cotizaciones</th></tr>');
            }
        }
    });
}
function verCotizacion(id) {
    $.ajax({
        url: "verDetallesCotizacion", data: { id: id }, type: "POST", dataType: "json", success: function (result) {

            $('#clienteM').html(result[0].cliente);
            $('#correoM').html(result[0].clienteCorreo);
            $('#direccionM').html(result[0].direccion);
            $('#contenidoM').html('<a href="' + result[0].urlPdf + '"  target="_blank">Ver</a>');
        }
    });
    type = $(this).attr('data-type');

    $('.overlay-container').fadeIn(function () {

        window.setTimeout(function () {
            $('.window-container.' + type).addClass('window-container-visible');
        }, 100);

    });
}

function verPaquete(id) {
    $.ajax({
        url: "verDetallesPack", data: { id: id }, type: "POST", dataType: "json", success: function (result) {

            $('#nombreM').html(result[0].nombre);
            $('#precioaltaM').html(" $ " +result[0].costo_alta);
            $('#preciobajaM').html(" $ " + result[0].costo_baja);
            $('#diasM').html(result[0].dias);
            $('#incluyeM').html(result[0].incluye);
            $('#itinerarioM').html(result[0].itinerario);
        }
    });
    type = $(this).attr('data-type');

    $('.overlay-container-pack').fadeIn(function () {

        window.setTimeout(function () {
            $('.window-container-pack.' + type).addClass('window-container-visible');
        }, 100);

    });
}

function eliminarPaquete(id) {
    $.ajax({
        url: "borraPaquete", data: { id: id }, type: "POST", dataType: "json", success: function (result) {
            alert("Paquete Eliminado");
            location.reload();
        }
    });
}

function disablePaquete(id) {
    $.ajax({
        url: "borraPaquete", data: { id: id, status: 0 }, type: "POST", dataType: "json", success: function (result) {
            if (result.success) {
                location.reload();
            }
        }
    });
}
function enablePaquete(id) {
    $.ajax({
        url: "borraPaquete", data: { id: id, status: 1 }, type: "POST", dataType: "json", success: function (result) {
            if (result.success) {
                location.reload();
            }
        }
    });
}

function verTour(id) {
    $.ajax({
        url: "verDetallesTour", data: { id: id }, type: "POST", dataType: "json", success: function (result) {

            $('#nombreMT').html(result[0].tour);
            $('#saleM').html(result[0].saliendo);
            $('#descripcionM').html(result[0].descripcion);
            $('#salidaM').html(result[0].horario_salida);
            $('#regresoM').html(result[0].horario_regreso);
            $('#duracionM').html(result[0].duracion);
            $('#tempAltaM').html(result[0].costo_alta + " MXN$");
            $('#tempBajaM').html(result[0].costo_baja + " MXN$");
        }
    });
    type = $(this).attr('data-type');

    $('.overlay-container-tour').fadeIn(function () {

        window.setTimeout(function () {
            $('.window-container-tour.' + type).addClass('window-container-visible');
        }, 100);

    });
}

function disableTour(id) {
    $.ajax({
        url: "borraTour", data: { id: id,status:0 }, type: "POST", dataType: "json", success: function (result) {
            if (result.success) {
                location.reload();
            }
        }
    });
}
function enableTour(id) {
    $.ajax({
        url: "borraTour", data: { id: id,status:1 }, type: "POST", dataType: "json", success: function (result) {
            if (result.success) {
                location.reload();
            }
        }
    });
}


function reporteMes(mes) {
    var agentes = new Array();
    var totales = new Array();
    var pagado = new Array();
    var diferencia = new Array();
    $.ajax({
        url: "reporteVentasGrafica", data: { fecha: mes }, type: "POST", dataType: "json", success: function (respuesta) {
            $('#tbodyVentasMes').html('');
            for (x = 0; x < respuesta.agenteVentas.length; x++) {
                agentes.push(respuesta.agenteVentas[x].agente);
                totales.push(respuesta.agenteVentas[x].total)
                pagado.push(respuesta.agenteVentas[x].totalpagado);
                diferencia.push(respuesta.agenteVentas[x].diferencia);
                var th = '<tr><th>' + respuesta.agenteVentas[x].agente + '</th><th>$ ' + respuesta.agenteVentas[x].total + '</th><th>$ ' + respuesta.agenteVentas[x].totalpagado + '</th><th>$ ' + respuesta.agenteVentas[x].diferencia + '</th></tr>';
                $('#tbodyVentasMes').append(th);
                //alert(agentes);
            };
            for (x = 0; x < respuesta.agentes.length; x++) {
                agentes.push(respuesta.agentes[x].nombre);
                totales.push(0);
                pagado.push(0);
                diferencia.push(0);
                var th = '<tr><th>' + respuesta.agentes[x].nombre + '</th><th>$ 0</th><th>$ 0</th><th>$ 0</th></tr>';
                $('#tbodyVentasMes').append(th);
                //alert(agentes);
            };
            for (x = 0; x < respuesta.ventaGral.length; x++) {
                var th = '<tr><th>Totales Generales</th><th>$ ' + respuesta.ventaGral[x].total + '</th><th>$ ' + respuesta.ventaGral[x].totalpagado + '</th><th>$ ' + respuesta.ventaGral[x].diferencia + '</th></tr>';
                $('#tbodyVentasMes').append(th);
                //alert(agentes);
            };
            
            $("#grafica-mes").html('');
            $("#grafica-mes").html('<canvas id="chart-venta-mes" width="500" height="550"></canvas>');
            var ctx = document.getElementById("chart-venta-mes");
           
            var cvs = ctx.getContext("2d");
            var myCharts = new Chart(cvs, {
                type: 'bar',
                data: {
                    labels: agentes,
                    datasets: [
                        {
                            label: 'Total',
                            backgroundColor: "#00695C",
                            data: totales
                        },
                        {
                            label: 'Total Pagado',
                            backgroundColor: "#FFC107",
                            data: pagado
                        },
                        {
                            label: 'Diferencia',
                            backgroundColor: "#C62828",
                            data: diferencia
                        }
                    ]
                },
                options: {
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero: true
                            }
                        }]
                    },
                    responsive: true
                }
            });
            
        }
    });
}


function enableRangosReportes(rango) {
    if (rango == "mes") {
        $("#rango-fechas").hide();
        $("#rango-mes").show();
    } else {
        $("#rango-fechas").show();
        $("#rango-mes").hide();
    }
}

function reportesRango() {
    var inicio = $("#fechaDesde").val();
    var fin = $("#fechaHasta").val();
    if (inicio.trim() != "" && fin.trim() != "") {
        var agentes = new Array();
        var totales = new Array();
        var pagado = new Array();
        var diferencia = new Array();
        $.ajax({
            url: "reporteVentasGraficaRango", data: { fechaI: inicio, fechaF: fin }, type: "POST", dataType: "json", success: function (respuesta) {
                $('#tbodyVentasMes').html('');
                for (x = 0; x < respuesta.agenteVentas.length; x++) {
                    agentes.push(respuesta.agenteVentas[x].agente);
                    totales.push(respuesta.agenteVentas[x].total)
                    pagado.push(respuesta.agenteVentas[x].totalpagado);
                    diferencia.push(respuesta.agenteVentas[x].diferencia);
                    var th = '<tr><th>' + respuesta.agenteVentas[x].agente + '</th><th>$ ' + respuesta.agenteVentas[x].total + '</th><th>$ ' + respuesta.agenteVentas[x].totalpagado + '</th><th>$ ' + respuesta.agenteVentas[x].diferencia + '</th></tr>';
                    $('#tbodyVentasMes').append(th);
                    //alert(agentes);
                };
                for (x = 0; x < respuesta.agentes.length; x++) {
                    agentes.push(respuesta.agentes[x].nombre);
                    totales.push(0);
                    pagado.push(0);
                    diferencia.push(0);
                    var th = '<tr><th>' + respuesta.agentes[x].nombre + '</th><th>$ 0</th><th>$ 0</th><th>$ 0</th></tr>';
                    $('#tbodyVentasMes').append(th);
                    //alert(agentes);
                };
                for (x = 0; x < respuesta.ventaGral.length; x++) {
                    var th = '<tr><th>Totales Generales</th><th>$ ' + respuesta.ventaGral[x].total + '</th><th>$ ' + respuesta.ventaGral[x].totalpagado + '</th><th>$ ' + respuesta.ventaGral[x].diferencia + '</th></tr>';
                    $('#tbodyVentasMes').append(th);
                    //alert(agentes);
                };
                var barChartData = {
                    type: 'bar',
                    labels: agentes,
                    datasets: [
                        {
                            label: 'Total',
                            fillColor: "#00695C",
                            strokeColor: "#ffffff",
                            highlightFill: "#1864f2",
                            highlightStroke: "#ffffff",
                            data: totales
                        },
                        {
                            label: 'Total Pagado',
                            fillColor: "#FFC107",
                            strokeColor: "#ffffff",
                            highlightFill: "#1864f2",
                            highlightStroke: "#ffffff",
                            data: pagado
                        },
                        {
                            label: 'Diferencia',
                            fillColor: "#C62828",
                            strokeColor: "#ffffff",
                            highlightFill: "#1864f2",
                            highlightStroke: "#ffffff",
                            data: diferencia
                        }
                    ]

                }
                $("#grafica-mes").html('');
                $("#grafica-mes").html('<canvas id="chart-venta-mes" width="500" height="550"></canvas>');
                var ctx = document.getElementById("chart-venta-mes");

                var cvs = ctx.getContext("2d");
                var myCharts = new Chart(cvs, {
                    type: 'bar',
                    data: {
                        labels: agentes,
                        datasets: [
                            {
                                label: 'Total',
                                backgroundColor: "#00695C",
                                data: totales
                            },
                            {
                                label: 'Total Pagado',
                                backgroundColor: "#FFC107",
                                data: pagado
                            },
                            {
                                label: 'Diferencia',
                                backgroundColor: "#C62828",
                                data: diferencia
                            }
                        ]
                    },
                    options: {
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }]
                        },
                        responsive: true
                    }
                });

            }
        });
    }
}


function comisionFecha(fecha) {
    $.ajax({
        url: "ComisionesFecha", data: { fecha: fecha }, type: "POST", dataType: "json", success: function (result) {
            $('#tbodyComision').html('');
            if (result.length > 0) {
                for (i = 0; i < result.length; i++) {
                    var th = '<tr><th>' + result[i].cliente + '</th><th>' + result[i].venta + '</th><th>' + result[i].total + ' MXN$</th><th>' + result[i].comision + ' MXN$</th><th>' + result[i].status + '</th></tr>';
                    $('#tbodyComision').append(th);
                }
            } else {
                $('#tbodyComision').html('<tr><th colspan="6" >Sin registros</th></tr>');
            }
        }
    });
}


function reporteGraficaAgentes() {
    var fechas = new Array();
    var total = new Array();
    var anticipo = new Array();
    var saldo = new Array();
    $.ajax({
        url: 'reporteAgentesGraficaRango',
        type: 'post',
        dataType: 'json',
        data: { id: $("#agents").val(), inicio: $("#inicio").val(), final: $("#final").val() }
    }).done(function (respuesta) {
        if (respuesta.registros.length > 0) {
            $('#tbodyReporte').html('');
            var tr = '';
            for (x = 0; x < respuesta.dias.length; x++) {
                var ban = false;
                for (y = 0; y < respuesta.registros.length; y++){
                    tr += '<tr>';
                    var f = respuesta.registros[y].fecha.split(' ');
                    var a = respuesta.dias[x].fecha.split(' ');
                    if (f[0] == a[0]) {
                        if (!ban) {
                            tr += '<th rowspan=' + respuesta.dias[x].cont + ' >'+a[0]+'</th>';
                        }
                        tr += '<th>' + respuesta.registros[y].total + '</th>' +
                                '<th>' + respuesta.registros[y].anticipo + '</th>' +
                                '<th>' + respuesta.registros[y].saldo + '</th>';
                        if (!ban) {
                            tr += '<th rowspan=' + respuesta.dias[x].cont + ' >' + respuesta.registros[y].totalventa + '</th>' +
                                '<th rowspan=' + respuesta.dias[x].cont + ' >' + respuesta.registros[y].totalpagado + '</th>' +
                                '<th rowspan=' + respuesta.dias[x].cont + ' >' + respuesta.registros[y].diferencia + '</th>';
                                ban = true;
                        }
                    }
                    tr += '</tr>';
                }
            }
            for (x = 0; x < respuesta.totales.length;x++){
                tr += '<tr><th colspan="4">Totales</th>'+
                        '<th>'+respuesta.totales[x].total+'</th>' +
                        '<th>'+respuesta.totales[x].totalpagado+'</th>' +
                        '<th>'+respuesta.totales[x].diferencia+'</th></tr>';
            }
            
            $('#tbodyReporte').append(tr);
        } else {
            $('#tbodyReporte').html('');
            var tr = '<tr><th colspan="8">Noy hay Registros</th></tr>';
            $('#tbodyReporte').append(tr);
        }


        for (x = 0; x < respuesta.registros.length; x++) {
            var f = respuesta.registros[x].fecha.split(' ');
            var a = fechas.indexOf(f[0]);
            if (a == -1) {
                fechas.push(f[0]);
                total.push(respuesta.registros[x].totalventa);
                anticipo.push(respuesta.registros[x].totalpagado);
                saldo.push(respuesta.registros[x].diferencia);
            }
        };
        if (respuesta.registros.length != 0) {
            $("#grafica-agente").html('');
            $("#grafica-agente").html('<p>Grafica de Ventas</p><canvas id="chart-venta-agente" width="1000" height="400"></canvas>');

            var ctx = document.getElementById("chart-venta-agente");
            var cvs = ctx.getContext("2d");
            var myChart = new Chart(cvs, {
                type: 'line',
                data: {
                    labels: fechas,
                    datasets: [
                        {
                            label: 'Diferencia',
                            backgroundColor: "#C62828",
                            fill: false,
                            lineTension: 0.1,
                            borderCapStyle: 'butt',
                            borderColor: "#C62828",
                            data: saldo
                        }, 
                        {
                            label: 'Total Pagado',
                            backgroundColor: "#FFC107",
                            fill: false,
                            lineTension: 0.1,
                            borderCapStyle: 'butt',
                            borderColor: "#FFC107",
                            data: anticipo
                        },
                        {
                            label: 'Total de Venta',
                            backgroundColor: "#00695C",
                            fill:false,
                            lineTension: 0.1,
                            borderCapStyle: 'butt',
                            borderColor: "#00695C",
                            data: total
                        }
                        
                    ]
                },
                options: {
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero: true
                            }
                        }]
                    },
                    responsive: true
                }

            });
        } else {
            $("#grafica-agente").html('');
        }
    });

}

function tipoPagoRef(value){
    if (value != "efectivo") {
        $(".comision-user").show();
        $("#referencia").val("");
    } else {
        $(".comision-user").hide();
        $("#referencia").val("-----");
    }
}

function userDisable(id) {
    $.ajax({
        url: "EstadoUsuario", data: { id: id,status:0 }, type: "POST", dataType: "json", success: function (result) {
            if (result.success) {
                location.reload();
            }
        }
    });
}
function userEnable(id) {
    $.ajax({
        url: "EstadoUsuario", data: { id: id, status: 1}, type: "POST", dataType: "json", success: function (result) {
            if (result.success) {
                location.reload();
            }
        }
    });
}


function cambioTemporada(temp) {
    if (confirm("¿Desea Cambiar la temporada?")) {
        if (temp == 1) {
            $.ajax({
                url: "cambioTemporada", data: { temp: temp }, type: "POST", dataType: "json", success: function (result) {
                    if (result.success) {
                        location.reload();
                    }
                }
            });
        } else {
            $.ajax({
                url: "cambioTemporada", data: { temp: 2 }, type: "POST", dataType: "json", success: function (result) {
                    if (result.success) {
                        location.reload();
                    }
                }
            });
        }
    }
}