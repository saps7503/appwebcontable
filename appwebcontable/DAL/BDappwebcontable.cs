using appwebcontable.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace appwebcontable.DAL
{
    public class BDappwebcontable : DbContext
    {
        public BDappwebcontable() : base(nameOrConnectionString: "BDappwebcontable") { }
        /* Bancos */
        public void SetBanco(String banco)
        {
            this.Database.ExecuteSqlCommand("call contable.new_banco (@banco)",
               new MySqlParameter("@banco", banco));
        }
        public IEnumerable<TBancos>
                      GetBancoNombre(string banco)
        {
            return this.Database.SqlQuery<TBancos>
                                    ("call contable.verifica_banco(@banco)",
                                    new MySqlParameter("@banco", banco));
        }
        public IEnumerable<TBancos>
                      GetBancos()
        {
            return this.Database.SqlQuery<TBancos>
                                    ("call contable.ver_bancos()");
        }
        /* Usuarios */
        public void SetUsuario(String nombre, String apellidos, String telefono, String email,
            String pass, String rol,Double comision, DateTime fechaRegistro, DateTime fechaModificacion,int temporada)
        {
            this.Database.ExecuteSqlCommand("call contable.new_usuario (@nombre,@apellidos,@telefono,@email,@pass,@rol,@comision,@fechaRegistro,@fechaModificacion,@temporada)",
               new MySqlParameter("@nombre", nombre), new MySqlParameter("@apellidos", apellidos), new MySqlParameter("@telefono", telefono),
               new MySqlParameter("@email", email), new MySqlParameter("@pass", pass), new MySqlParameter("@rol", rol), new MySqlParameter("@comision", comision),
               new MySqlParameter("@fechaRegistro", fechaRegistro), new MySqlParameter("@fechaModificacion", fechaModificacion),
               new MySqlParameter("@temporada", temporada));
        }

        public IEnumerable<TUsuario>
                      GetUsuarios()
        {
            return this.Database.SqlQuery<TUsuario>
                                    ("call contable.ver_usuarios()");
        }
        public IEnumerable<TUsuario>
                      LogIn(String correo, String pass)
        {
            return this.Database.SqlQuery<TUsuario>
                                    ("call contable.login(@correo,@pass)",
                                    new MySqlParameter("@correo", correo),
                                    new MySqlParameter("@pass", pass));
        }

        public void SetStatus(int idU, int st)
        {
            this.Database.ExecuteSqlCommand("call contable.status_Modificacion(@idU,@st)",
                new MySqlParameter("@idU", idU), new MySqlParameter("@st", st));
        }

        /* cuentas */
        public void SetCuenta(String alias, String banco, String numeroCuenta, Double saldoTotal,
            DateTime fechaRegistro, DateTime fechaModificacion)
        {
            this.Database.ExecuteSqlCommand("call contable.new_cuenta (@alias,@banco,@numeroCuenta,@saldoTotal,@fechaRegistro,@fechaModificacion)",
                new MySqlParameter("@alias", alias), new MySqlParameter("@banco", banco), new MySqlParameter("@numeroCuenta", numeroCuenta), new MySqlParameter("@saldoTotal", saldoTotal),
                new MySqlParameter("@fechaRegistro", fechaRegistro), new MySqlParameter("@fechaModificacion", fechaModificacion));
        }
        public IEnumerable<TCuenta>
                      GetCuentas()
        {
            return this.Database.SqlQuery<TCuenta>
                                    ("call contable.ver_cuenta()");
        }

        /* movimientos */
        public void SetMovimiento(int idCuenta, int idUsuario, String fecha, String descripcion,
            String referencia, String autorizacion, String concepto, Double deposito, Double retiro,
            DateTime fechaRegistro, DateTime fechaModificacion)
        {
            this.Database.ExecuteSqlCommand("call contable.new_movimiento (@idCuenta,@idUsuario,@fecha,@descripcion,@referencia,@autorizacion,@concepto,@deposito,@retiro,@fechaRegistro,@fechaModificacion)",
               new MySqlParameter("@idCuenta", idCuenta), new MySqlParameter("@idUsuario", idUsuario), new MySqlParameter("@fecha", fecha),
                new MySqlParameter("@descripcion", descripcion), new MySqlParameter("@referencia", referencia), new MySqlParameter("@autorizacion", autorizacion),
                new MySqlParameter("@concepto", concepto), new MySqlParameter("@deposito", deposito),
                new MySqlParameter("@retiro", retiro), new MySqlParameter("@fechaRegistro", fechaRegistro), new MySqlParameter("@fechaModificacion", fechaModificacion));
        }

        public IEnumerable<TMovimiento>
                      GetMovimiento(int idCuenta)
        {
            return this.Database.SqlQuery<TMovimiento>
                                    ("call contable.ver_movimiento (@idC)", new MySqlParameter("@idC", idCuenta));
        }

        public IEnumerable<TMovimiento>
                      GetMovimientoFecha(int idCuenta,int idU,String fecha)
        {
            return this.Database.SqlQuery<TMovimiento>
                                    ("call contable.ver_movimientoFecha (@idC,@idU,@fecha)", new MySqlParameter("@idC", idCuenta),
                                    new MySqlParameter("@idU", idU), new MySqlParameter("@fecha", fecha));
        }

        public IEnumerable<TMovimientoDetalles>
                      GetDetallesMov(int id)
        {
            return this.Database.SqlQuery<TMovimientoDetalles>
                                    ("call contable.detalles_mov (@id)", new MySqlParameter("@id", id));
        }

        public IEnumerable<TMovimiento>
                      GetMovimientoFilter(String fecha, String descripcion, String retiro,
            String deposito, String saldo, int idCuenta)
        {
            return this.Database.SqlQuery<TMovimiento>
                                    ("call contable.filter_mov(@fech,@des,@ret,@dep,@saldo,@idC)",
                                     new MySqlParameter("@fech", fecha), new MySqlParameter("@des", descripcion),
                                     new MySqlParameter("@ret", retiro), new MySqlParameter("@dep", deposito),
                                     new MySqlParameter("@saldo", saldo), new MySqlParameter("@idC", idCuenta));
        }

        public IEnumerable<TMovimiento>
                      GetMovimientoFilterGral(String var,int idCuenta)
        {
            return this.Database.SqlQuery<TMovimiento>
                                    ("call contable.filter_mov_gral(@var,@idC)",
                                     new MySqlParameter("@var", var), new MySqlParameter("@idC", idCuenta));
        }

        /* temporada */
        public void cambioTemporada(int temp)
        {
            this.Database.ExecuteSqlCommand("call contable.cambioTemporada(@temp)",
                new MySqlParameter("@temp", temp));
        }

        /* paquetes */
        public void SetPaquete(String nombre,Double precioalta,Double preciobaja,int dias,String incluye,String itinerario,DateTime fechaRegistro,DateTime fechaModificacion) {
            this.Database.ExecuteSqlCommand("call contable.new_paquete (@nombre,@precioalta,@preciobaja,@dias,@incluye,@itinerario,@fechaRegistro,@fechaModificacion)",
                new MySqlParameter("@nombre", nombre), new MySqlParameter("@precioalta", precioalta),
                new MySqlParameter("@preciobaja", preciobaja), new MySqlParameter("@dias", dias), new MySqlParameter("@incluye", incluye),
                new MySqlParameter("@itinerario", itinerario), new MySqlParameter("@fechaRegistro", fechaRegistro), new MySqlParameter("@fechaModificacion", fechaModificacion));
        }
        public IEnumerable<TPaquete>
                      GetPaquetes()
        {
            return this.Database.SqlQuery<TPaquete>
                                    ("call contable.ver_paquetes ()");
        }
        public IEnumerable<TPaquete>
                      GetPackFilterGral(String var)
        {
            return this.Database.SqlQuery<TPaquete>
                                    ("call contable.filter_pack_gral(@var)",
                                     new MySqlParameter("@var", var));
        }

        public IEnumerable<TPaquete>
                      GetPackFilterGralAdmin(String var)
        {
            return this.Database.SqlQuery<TPaquete>
                                    ("call contable.filter_pack_gralAdmin(@var)",
                                     new MySqlParameter("@var", var));
        }
        public IEnumerable<TPaquete>
                      GetDetallesPaquete(int id)
        {
            return this.Database.SqlQuery<TPaquete>
                                    ("call contable.detalles_pack (@pack)", new MySqlParameter("@pack", id));
        }

        public void DeletePaquete(int id,int status)
        {
            this.Database.ExecuteSqlCommand("call contable.borra_pack (@pack,@st)",
                new MySqlParameter("@pack", id), new MySqlParameter("@st", status));
        }

        public void actualizarPaquete(int id,String nombre, Double precioalta, Double preciobaja, int dias, String incluye, String itinerario)
        {
            this.Database.ExecuteSqlCommand("call contable.actualizarPaquete (@nombre,@costo_alta,@costo_baja,@incluye,@dias,@itinerario,@idP)",
                new MySqlParameter("@nombre", nombre), new MySqlParameter("@costo_alta", precioalta),
                new MySqlParameter("@costo_baja", preciobaja), new MySqlParameter("@incluye", incluye),
                new MySqlParameter("@dias", dias), new MySqlParameter("@itinerario", itinerario),
                new MySqlParameter("@idP", id));
        }

        /* tours */
        public void SetTour(String tour,String salida,String descripcion,String horasalida,
            String horaregreso,String duracion,Double costoalta,Double costobaja,
            DateTime fechaRegistro, DateTime fechaModificacion)
        {
            this.Database.ExecuteSqlCommand("call contable.new_tour (@tour,@salida,@descripcion,@horasalida,@horaregreso,@duracion,@costoalta,@costobaja,@fechaRegistro,@fechaModificacion)",
                new MySqlParameter("@tour", tour), new MySqlParameter("@salida", salida), new MySqlParameter("@descripcion", descripcion),
                new MySqlParameter("@horasalida", horasalida),
                new MySqlParameter("@horaregreso", horaregreso),
                new MySqlParameter("@duracion", duracion), new MySqlParameter("@costoalta", costoalta),
                new MySqlParameter("@costobaja", costobaja),
                new MySqlParameter("@fechaRegistro", fechaRegistro), new MySqlParameter("@fechaModificacion", fechaModificacion));
        }
        public IEnumerable<TTour>
                      GetTours()
        {
            return this.Database.SqlQuery<TTour>
                                    ("call contable.ver_tours ()");
        }

        public IEnumerable<TTour>
                      GetTourFilterGral(String var)
        {
            return this.Database.SqlQuery<TTour>
                                    ("call contable.filter_tour_gral(@var)",
                                     new MySqlParameter("@var", var));
        }

        public IEnumerable<TTour>
                      GetTourFilterGralAdmin(String var)
        {
            return this.Database.SqlQuery<TTour>
                                    ("call contable.filter_tour_gralAdmin(@var)",
                                     new MySqlParameter("@var", var));
        }

        public IEnumerable<TTour>
                      GetDetallesTour(int id)
        {
            return this.Database.SqlQuery<TTour>
                                    ("call contable.detalles_tour (@tour)", new MySqlParameter("@tour", id));
        }

        public void DeleteTour(int id,int status)
        {
            this.Database.ExecuteSqlCommand("call contable.borra_tour (@tour,@st)",
                new MySqlParameter("@tour", id), new MySqlParameter("@st", status));
        }

        public void actualizarTour(int id, String nombre,String sale,String descrip, String salida, String regreso,String hrs, Double precioalta, Double preciobaja)
        {
            this.Database.ExecuteSqlCommand("call contable.actualizarTour (@id,@nombre,@sale,@descp,@salida,@regreso,@hrs,@precioalta,@preciobaja)",
                new MySqlParameter("@id", id),new MySqlParameter("@nombre", nombre), new MySqlParameter("@sale", sale),
                new MySqlParameter("@descp", descrip), new MySqlParameter("@salida", salida),
                new MySqlParameter("@regreso", regreso), new MySqlParameter("@hrs", hrs),
                new MySqlParameter("@precioalta", precioalta), new MySqlParameter("@preciobaja", preciobaja));
        }

        /* ventas */
        public IEnumerable<TIdVenta> SetVenta(int idUsuario,String cliente, String tipoServicio, String nombreServicio, String tipoPago,Double total,Double anticipo,Double saldo,String referencia,String comentarios,String status, DateTime fechaRegistro, DateTime fechaModificacion,
            String correo,String telefono,String inicio,String final)
        {
            return this.Database.SqlQuery<TIdVenta>("call contable.new_venta (@idUsuario,@cliente,@tipoServicio,@nombreServicio,@tipoPago,@total,@anticipo,@saldo,@referencia,@comentarios,@estado,@fechaRegistro,@fechaModificacion,@correo,@telefono,@inicio,@final)",
                new MySqlParameter("@idUsuario", idUsuario), new MySqlParameter("@cliente", cliente), new MySqlParameter("@tipoServicio", tipoServicio), new MySqlParameter("@nombreServicio", nombreServicio),
                new MySqlParameter("@tipoPago", tipoPago), new MySqlParameter("@total", total), new MySqlParameter("@anticipo", anticipo), new MySqlParameter("@saldo", saldo),
                new MySqlParameter("@referencia", referencia), new MySqlParameter("@comentarios", comentarios), new MySqlParameter("@estado", status),
                new MySqlParameter("@fechaRegistro", fechaRegistro), new MySqlParameter("@fechaModificacion", fechaModificacion),
                 new MySqlParameter("@correo", correo), new MySqlParameter("@telefono", telefono),
                  new MySqlParameter("@inicio", inicio), new MySqlParameter("@final", final));
        }

        public IEnumerable<TVenta>
                      GetVenta(int id,String fecha)
        {
            return this.Database.SqlQuery<TVenta>
                                    ("call contable.ver_ventas (@idA,@fecha)", new MySqlParameter("@idA", id),
                                     new MySqlParameter("@fecha", fecha));
        }
        public IEnumerable<TVenta>
                      GetDetallesVenta(int id)
        {
            return this.Database.SqlQuery<TVenta>
                                    ("call contable.detalles_venta (@idVenta)", new MySqlParameter("@idVenta", id));
        }
        /*public IEnumerable<TFecha>
                      GetVentaFecha(int id)
        {
            return this.Database.SqlQuery<TFecha>
                                    ("call contable.fechas_venta (@id)", new MySqlParameter("@id", id));
        }*/
        /* comision */
        public void SetComision(int agente, int venta, Double comision,String pago)
        {
            this.Database.ExecuteSqlCommand("call contable.new_comision (@idA,@idV,@com,@pago)",
                new MySqlParameter("@idA", agente), new MySqlParameter("@idV", venta), 
                new MySqlParameter("@com", comision), new MySqlParameter("@pago", pago));
        }

        public IEnumerable<TComision>
                      GetComision(int idA, String fecha)
        {
            return this.Database.SqlQuery<TComision>
                                    ("call contable.ver_comisiones(@idA,@fecha)",
                                    new MySqlParameter("@idA", idA),
                                    new MySqlParameter("@fecha", fecha));
        }

        /* cotizacion */
        public void SetCotizacion(int idAgente, String cliente, String correo,String direccion,String mensaje,String url)
        {
            this.Database.ExecuteSqlCommand("call contable.new_cotizacion (@idAgente,@cliente,@clienteCorreo,@direccion,@mensaje,@url)",
                new MySqlParameter("@idAgente", idAgente), new MySqlParameter("@cliente", cliente), new MySqlParameter("@clienteCorreo", correo),
                new MySqlParameter("@direccion", direccion), new MySqlParameter("@mensaje", mensaje), new MySqlParameter("@url", url));
        }

        public IEnumerable<TCotizaciones>
                      GetCotizacion(int id, String fecha)
        {
            return this.Database.SqlQuery<TCotizaciones>
                                    ("call contable.ver_cotizaciones (@idA,@fecha)", new MySqlParameter("@idA", id),
                                     new MySqlParameter("@fecha", fecha));
        }

        public IEnumerable<TCotizaciones>
                      GetDetallesCotizacion(int id)
        {
            return this.Database.SqlQuery<TCotizaciones>
                                    ("call contable.detalles_cotizacion (@cotizacion)", new MySqlParameter("@cotizacion", id));
        }
        public IEnumerable<TConteoCotizacion>
                      GetCantCotizacion(int id,String fecha)
        {
            return this.Database.SqlQuery<TConteoCotizacion>
                                    ("call contable.cant_cotizacion (@idA,@fecha)", new MySqlParameter("@idA", id),
                                    new MySqlParameter("@fecha", fecha));
        }

        public IEnumerable<TTotalVenta>
                      GetTotalVentaDia(int id, String fecha)
        {
            return this.Database.SqlQuery<TTotalVenta>
                                    ("call contable.total_ventas (@idU,@fecha)", new MySqlParameter("@idU", id),
                                    new MySqlParameter("@fecha", fecha));
        }
        public IEnumerable<TConteoCotizacion>
                      GetCantVenta(int id, String fecha)
        {
            return this.Database.SqlQuery<TConteoCotizacion>
                                    ("call contable.cant_ventas (@idU,@fecha)", new MySqlParameter("@idU", id),
                                    new MySqlParameter("@fecha", fecha));
        }

        /* reporte de ventas*/
        public IEnumerable<TReporteVentaMes>
                      GetReporteVentaMes(String fecha)
        {
            return this.Database.SqlQuery<TReporteVentaMes>
                                    ("call contable.reporte_ventaMes (@fecha)",
                                    new MySqlParameter("@fecha", fecha));
        }
        public IEnumerable<TReporteVentaMes>
                      GetReporteVentaMesGral(String fecha)
        {
            return this.Database.SqlQuery<TReporteVentaMes>
                                    ("call contable.reporte_VentaMesGral (@fecha)",
                                    new MySqlParameter("@fecha", fecha));
        }
        public IEnumerable<TUsuario>
                      GetReporteVentaNo(String fecha)
        {
            return this.Database.SqlQuery<TUsuario>
                                    ("call contable.reporte_ventaMesNo(@fecha)",
                                    new MySqlParameter("@fecha", fecha));
        }
        /* reporte rango*/
        public IEnumerable<TReporteVentaMes>
                      GetReporteVentaRango(String fechaI,String fechaF)
        {
            return this.Database.SqlQuery<TReporteVentaMes>
                                    ("call contable.reporte_ventasRango (@fechaI,@fechaF)",
                                    new MySqlParameter("@fechaI", fechaI),
                                    new MySqlParameter("@fechaF", fechaF));
        }
        public IEnumerable<TReporteVentaMes>
                      GetReporteVentaRangoGral(String fechaI, String fechaF)
        {
            return this.Database.SqlQuery<TReporteVentaMes>
                                    ("call contable.reporte_ventasRangoGral (@fechaI,@fechaF)",
                                    new MySqlParameter("@fechaI", fechaI),
                                    new MySqlParameter("@fechaF", fechaF));
        }
        public IEnumerable<TUsuario>
                      GetReporteRangoNo(String fechaI, String fechaF)
        {
            return this.Database.SqlQuery<TUsuario>
                                    ("call contable.reporte_ventasRangoNo(@fechaI,@fechaF)",
                                    new MySqlParameter("@fechaI", fechaI),
                                    new MySqlParameter("@fechaF", fechaF));
        }

        /* agente de ventas*/
        public IEnumerable<TUsuario>
                      GetAgentes()
        {
            return this.Database.SqlQuery<TUsuario>
                                    ("call contable.ver_agentes()");
        }

        public IEnumerable<TReporteAgente>
                      GetReporteAgentes(int id,String inicio,String final)
        {
            return this.Database.SqlQuery<TReporteAgente>
                                    ("call contable.reporte_ventaAgente(@id,@inicio,@final)",
                                    new MySqlParameter("@id", id),
                                    new MySqlParameter("@inicio", inicio),
                                    new MySqlParameter("@final", final));
        }

        public IEnumerable<TVentaConteo>
                      GetVentaConteo(int id, String inicio, String final)
        {
            return this.Database.SqlQuery<TVentaConteo>
                                    ("call contable.ver_VentasConteo(@id,@inicio,@final)",
                                    new MySqlParameter("@id", id),
                                    new MySqlParameter("@inicio", inicio),
                                    new MySqlParameter("@final", final));
        }

        public IEnumerable<TCotizacionAgente>
                      GetCotizacionAgente(int id, String inicio, String final)
        {
            return this.Database.SqlQuery<TCotizacionAgente>
                                    ("call contable.reporte_cotizacionAgente(@id,@inicio,@final)",
                                    new MySqlParameter("@id", id),
                                    new MySqlParameter("@inicio", inicio),
                                    new MySqlParameter("@final", final));
        }

        public IEnumerable<TReporteVentaMes>
                      GetReporteGralAgente(int id, String inicio, String final)
        {
            return this.Database.SqlQuery<TReporteVentaMes>
                                    ("call contable.reporte_VentaGralAgente(@id,@inicio,@final)",
                                    new MySqlParameter("@id", id),
                                    new MySqlParameter("@inicio", inicio),
                                    new MySqlParameter("@final", final));
        }
    }
}