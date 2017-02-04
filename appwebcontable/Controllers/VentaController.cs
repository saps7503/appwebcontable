using appwebcontable.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using iTextSharp.text;
using System.IO;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;

namespace appwebcontable.Controllers
{
    public class VentaController : Controller
    {
        // GET: Venta
        public ActionResult Ventas()
        {
            //condicion para corroborar si esta logueado y si tiene permisos para acceder
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("agente de ventas"))
            {
                ViewBag.fecha = DateTime.Today.ToString("yyyy-MM-dd");
                ViewBag.nombre = Session["nombre"].ToString();
                ViewBag.temporada = Session["temporada"].ToString();
                //realizo la conexion mediante Dbcontext y llamo a GetPaquetes que ejecuta un procedimiento almacenado
                //para consultar la base de datos
                BDappwebcontable DbContext = new BDappwebcontable();
                var listPaquetes = DbContext.GetPackFilterGral("");
                ViewBag.countPaquetes = listPaquetes.Count();
                ViewBag.vistaListaPaquetes = listPaquetes;
                ViewBag.temporada = int.Parse(Session["temporada"].ToString());
                return View();
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");

        }

        //muestra la vista con el formulario para crear un nuevo paquete
        [HttpGet]
        public ActionResult CrearPaquete() {
            //condicion para corroborar si esta logueado y si tiene permisos para acceder
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("administrador"))
            {
                ViewBag.nombre = Session["nombre"].ToString();
                return View();
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }
        //muestra la vista con una tabla llena de todos los paquetes en la BD
        [HttpGet]
        public ActionResult VerPaquetes() {
            //condicion para corroborar si esta logueado y si tiene permisos para acceder
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("administrador"))
            {
                ViewBag.nombre = Session["nombre"].ToString();
                //realizo la conexion mediante Dbcontext y llamo a GetPaquetes que ejecuta un procedimiento almacenado
                //para consultar la base de datos
                BDappwebcontable DbContext = new BDappwebcontable();
                var listPaquetes = DbContext.GetPaquetes();
                ViewBag.vistaListaPaquetes = listPaquetes;
                ViewBag.temporada = int.Parse(Session["temporada"].ToString());
                return View();
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }
        //Devuelve una serie de registros en formato Json que es procesado en JS mediante una llamada de AJAX
        [HttpPost]
        public ActionResult Filter(FormCollection formCollection)
        {
            //condicion para corroborar si esta logueado y si tiene permisos para acceder
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("administrador") || Session["rol"].ToString().Equals("agente de ventas"))
            {
                //realizo la conexion mediante Dbcontext y llamo a GetPackFilterGral que ejecuta un procedimiento almacenado
                //que recibe un parametro con el que se cosulta a la BD para cargar los registros que coincidan
                BDappwebcontable DbContext = new BDappwebcontable();
                var packs = DbContext.GetPackFilterGral(formCollection["palabra"]);
                return Json(packs);
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }

        [HttpPost]
        public ActionResult FilterAdmin(FormCollection formCollection)
        {
            //condicion para corroborar si esta logueado y si tiene permisos para acceder
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("administrador") || Session["rol"].ToString().Equals("agente de ventas"))
            {
                //realizo la conexion mediante Dbcontext y llamo a GetPackFilterGral que ejecuta un procedimiento almacenado
                //que recibe un parametro con el que se cosulta a la BD para cargar los registros que coincidan
                BDappwebcontable DbContext = new BDappwebcontable();
                var packs = DbContext.GetPackFilterGralAdmin(formCollection["palabra"]);
                return Json(packs);
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }
        //Recibe los datos de un formulario o mediante ajax y los inserta en la BD tabla de paquete
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Registrar(FormCollection formCollection) {
            //condicion para corroborar si esta logueado y si tiene permisos para acceder
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("administrador"))
            {
                BDappwebcontable DbContext = new BDappwebcontable();
                //usa el objeto Dbcontext para insertar llamando a una funcion que ejecuta un procedimiento
                //alamcenado y le envio los parametros
                DbContext.SetPaquete(formCollection["paquete"], Double.Parse(formCollection["precioalta"]),
                    Double.Parse(formCollection["preciobaja"]),
                    int.Parse(formCollection["dias"]), formCollection["incluye"], formCollection["itinerario"],
                    DateTime.Now, DateTime.Now);
                return Json(new { success = true });
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }

        //devuelve la vista con un formulario para crear un nuevo tour
        [HttpGet]
        public ActionResult CrearTour() {
            //condicion para corroborar si esta logueado y si tiene permisos para acceder
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("administrador"))
            {
                ViewBag.nombre = Session["nombre"].ToString();
                return View();
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }
        //Recibe los datos de un formulario o mediante ajax y los inserta en la BD tabla de tours
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult RegistrarTour(FormCollection formCollection) {
            //condicion para corroborar si esta logueado y si tiene permisos para acceder
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("administrador"))
            {
                BDappwebcontable DbContext = new BDappwebcontable();
                //usa el objeto Dbcontext para insertar llamando a una funcion que ejecuta un procedimiento
                //alamcenado y le envio los parametros

                DbContext.SetTour(formCollection["tour"], formCollection["salida"],
                    formCollection["descripcion"], formCollection["horasalida"],
                    formCollection["horaregreso"], formCollection["duracion"],
                    Double.Parse(formCollection["costoalta"]),
                    Double.Parse(formCollection["costobaja"]),
                    DateTime.Now, DateTime.Now);
                return Json(new { success = true });

            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }


        //muestra la vista con una tabla llena de todos los tours en la BD
        [HttpGet]
        public ActionResult VerTours()
        {
            //condicion para corroborar si esta logueado y si tiene permisos para acceder
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("administrador"))
            {
                ViewBag.nombre = Session["nombre"].ToString();
                //realizo la conexion mediante Dbcontext y llamo a GetTours que ejecuta un procedimiento almacenado
                //para consultar la base de datos
                BDappwebcontable DbContext = new BDappwebcontable();
                var listTours = DbContext.GetTours();
                ViewBag.vistaListaTours = listTours;
                ViewBag.temporada = int.Parse(Session["temporada"].ToString());
                return View();
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }

        //Devuelve una serie de registros en formato Json que es procesado en JS mediante una llamada de AJAX
        [HttpPost]
        public ActionResult FilterTour(FormCollection formCollection)
        {
            //condicion para corroborar si esta logueado y si tiene permisos para acceder
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("administrador") || Session["rol"].ToString().Equals("agente de ventas"))
            {
                //realizo la conexion mediante Dbcontext y llamo a GetTourFilterGral que ejecuta un procedimiento almacenado
                //que recibe un parametro con el que se cosulta a la BD para cargar los registros que coincidan
                BDappwebcontable DbContext = new BDappwebcontable();
                var tours = DbContext.GetTourFilterGral(formCollection["palabra"]);
                var tempo = int.Parse(Session["temporada"].ToString());
                return Json(tours);
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }

        [HttpPost]
        public ActionResult FilterTourAdmin(FormCollection formCollection)
        {
            //condicion para corroborar si esta logueado y si tiene permisos para acceder
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("administrador") || Session["rol"].ToString().Equals("agente de ventas"))
            {
                //realizo la conexion mediante Dbcontext y llamo a GetTourFilterGral que ejecuta un procedimiento almacenado
                //que recibe un parametro con el que se cosulta a la BD para cargar los registros que coincidan
                BDappwebcontable DbContext = new BDappwebcontable();
                var tours = DbContext.GetTourFilterGralAdmin(formCollection["palabra"]);
                var tempo = int.Parse(Session["temporada"].ToString());
                return Json(tours);
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }

        [HttpPost]
        public ActionResult registrarVenta(FormCollection formCollection) {
            //condicion para corroborar si esta logueado y si tiene permisos para acceder
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("agente de ventas"))
            {
                //realizo la conexion mediante Dbcontext y llamo a SetVenta que recibe una serie de parametros e inserta
                //un nuevo registro en ventas
                BDappwebcontable DbContext = new BDappwebcontable();
                var saldo = Double.Parse(formCollection["saldo"]);
                String pago = "Pago parcial";
                if (saldo == 0) {
                    pago = "Pago total";
                }
                var idVenta = DbContext.SetVenta(int.Parse(Session["idUsuario"].ToString()), formCollection["cliente"], formCollection["tipoServicio"],
                    formCollection["nombreServicio"], formCollection["tipoPago"],
                    Double.Parse(formCollection["total"]), Double.Parse(formCollection["anticipo"]),
                    Double.Parse(formCollection["saldo"]), formCollection["referencia"],
                    formCollection["comentarios"], pago, DateTime.Now, DateTime.Now, formCollection["correo"], formCollection["telefono"],
                    formCollection["fechaInicio"], formCollection["fechaFinal"]);
                int id = idVenta.ElementAt(0).id;
                DbContext.SetComision(int.Parse(Session["idUsuario"].ToString()), id, Double.Parse(Session["comision"].ToString()), formCollection["tipoPago"]);
                return Json(new { success = true });
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }

        //devuelve la vista con los registros de ventas del agente en turno
        [HttpGet]
        public ActionResult verVentas() {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("agente de ventas"))
            {
                ViewBag.nombre = Session["nombre"].ToString();
                //consulta a la base de  datos para traer registros de venta del agente en turno y del dia actual
                BDappwebcontable DbContext = new BDappwebcontable();
                var listVentas = DbContext.GetVenta(int.Parse(Session["idUsuario"].ToString()), DateTime.Today.ToString("yyyy-MM-dd"));
                ViewBag.listVentasAgente = listVentas;
                var cotizacion = DbContext.GetCantCotizacion(int.Parse(Session["idUsuario"].ToString()), DateTime.Today.ToString("yyyy-MM-dd"));
                ViewBag.cant = cotizacion.ElementAt(0).cont;
                var venta = DbContext.GetTotalVentaDia(int.Parse(Session["idUsuario"].ToString()), DateTime.Today.ToString("yyyy-MM-dd"));
                ViewBag.total = venta.ElementAt(0).total;
                var ventasDia = DbContext.GetCantVenta(int.Parse(Session["idUsuario"].ToString()), DateTime.Today.ToString("yyyy-MM-dd"));
                ViewBag.cantVentas = ventasDia.ElementAt(0).cont;
                ViewBag.fecha = DateTime.Today.ToString("yyyy-MM-dd");
                return View();
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }

        [HttpPost]
        public ActionResult dataVenta(FormCollection formCollection) {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("agente de ventas"))
            {
                BDappwebcontable DbContext = new BDappwebcontable();
                int id = int.Parse(formCollection["ID"]);
                var venta = DbContext.GetDetallesVenta(id);
                return Json(venta);
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }


        [HttpPost]
        public ActionResult verVentasDia(FormCollection formCollection) {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("agente de ventas"))
            {
                //consulta a la base de  datos para traer registros de venta del agente en turno y del dia actual
                BDappwebcontable DbContext = new BDappwebcontable();
                var listVentas = DbContext.GetVenta(int.Parse(Session["idUsuario"].ToString()), formCollection["fecha"]);
                var cotizacion = DbContext.GetCantCotizacion(int.Parse(Session["idUsuario"].ToString()), formCollection["fecha"]);
                var cant = cotizacion.ElementAt(0).cont;
                var venta = DbContext.GetTotalVentaDia(int.Parse(Session["idUsuario"].ToString()), formCollection["fecha"]);
                var total = venta.ElementAt(0).total;
                var ventasDia = DbContext.GetCantVenta(int.Parse(Session["idUsuario"].ToString()), formCollection["fecha"]);
                var cantVentas = ventasDia.ElementAt(0).cont;
                return Json(new { ventas = listVentas, cant = cant, total = total, cantVentas = cantVentas });
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }


        [HttpPost]
        public ActionResult verDetallesPack(FormCollection formCollection) {
            //condicion para corroborar si esta logueado y si tiene permisos para acceder
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("administrador") || Session["rol"].ToString().Equals("agente de ventas")) {
                BDappwebcontable DbContext = new BDappwebcontable();
                var detallesPack = DbContext.GetDetallesPaquete(int.Parse(formCollection["id"]));
                return Json(detallesPack);
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }

        [HttpPost]
        public ActionResult borraPaquete(FormCollection formCollection) {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("administrador"))
            {
                BDappwebcontable DbContext = new BDappwebcontable();
                DbContext.DeletePaquete(int.Parse(formCollection["id"]), int.Parse(formCollection["status"]));
                return Json(new { success = true });
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }

        [HttpPost]
        public ActionResult verDetallesTour(FormCollection formCollection)
        {
            //condicion para corroborar si esta logueado y si tiene permisos para acceder
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("administrador") || Session["rol"].ToString().Equals("agente de ventas"))
            {
                BDappwebcontable DbContext = new BDappwebcontable();
                var detallesTour = DbContext.GetDetallesTour(int.Parse(formCollection["id"]));
                return Json(detallesTour);
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }

        [HttpPost]
        public ActionResult borraTour(FormCollection formCollection)
        {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("administrador"))
            {
                BDappwebcontable DbContext = new BDappwebcontable();
                DbContext.DeleteTour(int.Parse(formCollection["id"]), int.Parse(formCollection["status"]));
                return Json(new { success = true });
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }

        [HttpGet]
        public ActionResult registrarCotizacion() {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("agente de ventas"))
            {
                ViewBag.nombre = Session["nombre"].ToString();
                return View();
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult crearCotizacion(FormCollection formCollection) {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("agente de ventas"))
            {
                Image objImagePdf;
                String img = Server.MapPath("~/imagenes/inge-01.png");
                objImagePdf = Image.GetInstance(img);
                objImagePdf.ScaleToFit(610, 3330);
                objImagePdf.Alignment = iTextSharp.text.Image.UNDERLYING;
                objImagePdf.SetAbsolutePosition(0, 7);
                Document doc = new Document(PageSize.LETTER, 36, 36, 90, 100);
                String nombrepdf = formCollection["cliente"] + "-Cotizacion-" + System.IO.Path.GetRandomFileName(); 
                string fileName = Server.MapPath("~/cotizaciones-pdf/") + nombrepdf + ".pdf";
                PdfWriter writer = PdfWriter.GetInstance(doc,
                                            new FileStream(fileName, FileMode.Create));

                // Abrimos el archivo
                String dia = DateTime.Now.ToString();
                doc.Open();
                doc.Add(objImagePdf);
                // Se crea el tipo de Font que vamos utilizar
                iTextSharp.text.Font _standardFont = new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.HELVETICA, 8, iTextSharp.text.Font.NORMAL, BaseColor.BLACK);
                // Se escribe el encabezamiento en el documento
                Paragraph titulo = new Paragraph("Mexica Tours Cotización");
                titulo.Alignment = Element.ALIGN_LEFT;
                Paragraph fecha = new Paragraph(dia,_standardFont);
                fecha.Alignment = Element.ALIGN_RIGHT;
                doc.Add(titulo);
                doc.Add(fecha);
                doc.Add(Chunk.NEWLINE);
                doc.Add(new Paragraph("Cliente: " + formCollection["cliente"], _standardFont));
                doc.Add(new Paragraph("Dirección: " + formCollection["direccion"], _standardFont));
                doc.Add(new Paragraph("E-mail: "+ formCollection["correo"], _standardFont));
                doc.Add(Chunk.NEWLINE);
                doc.Add(Chunk.NEWLINE);
                
                //doc.Add(new Paragraph(formCollection["mensaje"], _standardFont));
                using (StringReader sr = new StringReader(formCollection["mensaje"]))
                {
                    StyleSheet styles = new StyleSheet();

                    List<IElement> elements = iTextSharp.text.html.simpleparser.HTMLWorker.ParseToList(sr, styles);
                    foreach (IElement el in elements)
                    {
                        
                        doc.Add(el);
                    }
                }
                doc.Close();
                writer.Close();
                /* ---- */
                String archivo = Server.MapPath("~/cotizaciones-pdf/" + nombrepdf + ".pdf");
                MailMessage mail = new MailMessage();
                mail.To.Add(formCollection["correo"]);
                mail.From = new MailAddress("ovallesoft@gmail.com");
                mail.Subject = "Cotización";
                mail.IsBodyHtml = true;
                mail.Body = "";
                MailAddress copy = new MailAddress("arcoscruzdavid@gmail.com");
                mail.Bcc.Add(copy);
                mail.Attachments.Add(new System.Net.Mail.Attachment(archivo));
                SmtpClient smtp = new SmtpClient();

                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new System.Net.NetworkCredential("mexicatours1@gmail.com", "sistemas2016");
                smtp.EnableSsl = true;

                smtp.Send(mail);

                String url = "../../contabilidad/cotizaciones-pdf/" + nombrepdf + ".pdf";
                BDappwebcontable DbContext = new BDappwebcontable();
                DbContext.SetCotizacion(int.Parse(Session["idUsuario"].ToString()), formCollection["cliente"],
                    formCollection["correo"], formCollection["direccion"], formCollection["mensaje"],url);
                return Json(new { success = true });
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }

        [HttpGet]
        public ActionResult verCotizaciones() {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("agente de ventas"))
            {
                ViewBag.nombre = Session["nombre"].ToString();
                ViewBag.fecha = DateTime.Today.ToString("yyyy-MM-dd");
                BDappwebcontable DbContext = new BDappwebcontable();
                var listaCotizacion = DbContext.GetCotizacion(int.Parse(Session["idUsuario"].ToString()), DateTime.Today.ToString("yyyy-MM-dd"));
                ViewBag.vistaCotizacion = listaCotizacion;
                return View();
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }

        [HttpPost]
        public ActionResult verCotizacionDia(FormCollection formCollection)
        {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("agente de ventas"))
            {
                //consulta a la base de  datos para traer registros de venta del agente en turno y del dia actual
                BDappwebcontable DbContext = new BDappwebcontable();
                var listVentas = DbContext.GetCotizacion(int.Parse(Session["idUsuario"].ToString()), formCollection["fecha"]);
                return Json(listVentas);
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }

        [HttpPost]
        public ActionResult verDetallesCotizacion(FormCollection formCollection)
        {
            //condicion para corroborar si esta logueado y si tiene permisos para acceder
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("administrador") || Session["rol"].ToString().Equals("agente de ventas"))
            {
                BDappwebcontable DbContext = new BDappwebcontable();
                var detallesCotizacion = DbContext.GetDetallesCotizacion(int.Parse(formCollection["id"]));
                return Json(detallesCotizacion);
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }

        [HttpGet]
        public ActionResult reporteVentas() {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("contador") || Session["rol"].ToString().Equals("administrador"))
            {
                ViewBag.nombre = Session["nombre"].ToString();
                BDappwebcontable DbContext = new BDappwebcontable();
                var reportes = DbContext.GetReporteVentaMes(DateTime.Today.ToString("yyyy-MM"));
                ViewBag.reportesMes = reportes;
                var reportesGral = DbContext.GetReporteVentaMesGral(DateTime.Today.ToString("yyyy-MM"));
                ViewBag.reportesMesGral = reportesGral;
                var reporteVentaNo = DbContext.GetReporteVentaNo(DateTime.Today.ToString("yyyy-MM"));
                ViewBag.reportesVentasNo = reporteVentaNo;
                ViewBag.rol = Session["rol"].ToString();
                ViewBag.mes = DateTime.Today.ToString("yyyy-MM");
                ViewBag.fecha = DateTime.Today.ToString("yyyy-MM-dd");
                return View();
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }

        [HttpPost]
        public ActionResult reporteVentasGrafica(FormCollection formCollection)
        {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("contador") || Session["rol"].ToString().Equals("administrador"))
            {
                BDappwebcontable DbContext = new BDappwebcontable();
                var reportes = DbContext.GetReporteVentaMes(formCollection["fecha"]);
                ViewBag.reportesMes = reportes;
                var reportesGral = DbContext.GetReporteVentaMesGral(formCollection["fecha"]);
                ViewBag.reportesMesGral = reportesGral;
                var reporteVentaNo = DbContext.GetReporteVentaNo(formCollection["fecha"]);
                ViewBag.reportesVentasNo = reporteVentaNo;
                
                return Json(new {agenteVentas = reportes,agentes = reporteVentaNo,ventaGral = reportesGral});
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }

        [HttpPost]
        public ActionResult reporteVentasGraficaRango(FormCollection formCollection)
        {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("contador") || Session["rol"].ToString().Equals("administrador"))
            {
                BDappwebcontable DbContext = new BDappwebcontable();
                String fechaI = formCollection["fechaI"] + " 00:00:00";
                String fechaF = formCollection["fechaF"] + " 23:59:59";
                var reportes = DbContext.GetReporteVentaRango(fechaI,fechaF);
                ViewBag.reportesMes = reportes;
                var reportesGral = DbContext.GetReporteVentaRangoGral(fechaI, fechaF);
                ViewBag.reportesMesGral = reportesGral;
                var reporteVentaNo = DbContext.GetReporteRangoNo(fechaI, fechaF);
                ViewBag.reportesVentasNo = reporteVentaNo;

                return Json(new { agenteVentas = reportes, agentes = reporteVentaNo, ventaGral = reportesGral });
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }


        [HttpGet]
        public ActionResult Comisiones()
        {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("agente de ventas"))
            {
                //consulta a la base de  datos para traer registros de venta del agente en turno y del dia actual
                ViewBag.nombre = Session["nombre"].ToString();
                ViewBag.fecha = DateTime.Today.ToString("yyyy-MM-dd");
                ViewBag.comision = Session["comision"].ToString();

                BDappwebcontable DbContext = new BDappwebcontable();
                var comisiones = DbContext.GetComision(int.Parse(Session["idUsuario"].ToString()),DateTime.Today.ToString("yyyy-MM-dd"));
                ViewBag.Listcomisiones = comisiones;
                ViewBag.Countcomision = comisiones.Count();
                return View();
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }
        [HttpPost]
        public ActionResult ComisionesFecha(FormCollection formCollection)
        {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("agente de ventas"))
            {
                //consulta a la base de  datos para traer registros de venta del agente en turno y del dia actual
                

                BDappwebcontable DbContext = new BDappwebcontable();
                var comisiones = DbContext.GetComision(int.Parse(Session["idUsuario"].ToString()), formCollection["fecha"]);
                
                return Json(comisiones);
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }

        [HttpGet]
        public ActionResult reporteAgentes() {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("contador") || Session["rol"].ToString().Equals("administrador"))
            {

                var dias = DateTime.DaysInMonth(DateTime.Now.Year,DateTime.Now.Month);
                ViewBag.nombre = Session["nombre"].ToString();
                String inicio = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1).ToString("yyyy-MM-dd");
                String fin = new DateTime(DateTime.Now.Year, DateTime.Now.Month, dias).ToString("yyyy-MM-dd");
                ViewBag.fecha = inicio;
                ViewBag.fechaFinal = fin;
                String fechaI = inicio + " 00:00:00";
                String fechaF = fin + " 23:59:59";
                ViewBag.rol = Session["rol"].ToString();
                BDappwebcontable DbContext = new BDappwebcontable();
                BDappwebcontable DbContext2 = new BDappwebcontable();
                var listagentes= DbContext.GetAgentes();
                int idA = listagentes.ElementAt(0).id;
                ViewBag.agentes = listagentes;
                // datos de prueba
                var registros = DbContext.GetReporteAgentes(idA, fechaI,fechaF);
                ViewBag.reporteAgentes = registros;
                ViewBag.cantAgentes = registros.Count();
                var diasMes = DbContext2.GetVentaConteo(idA, fechaI, fechaF);
                ViewBag.ConteoMes = diasMes;
                var reporteVentas = DbContext.GetReporteGralAgente(idA, fechaI, fechaF);
                ViewBag.totales = reporteVentas;
                return View();
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }

        [HttpPost]
        public ActionResult reporteAgentesGrafica(FormCollection formCollection)
        {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("contador") || Session["rol"].ToString().Equals("administrador"))
            {

                var dias = DateTime.DaysInMonth(int.Parse(formCollection["anio"]), int.Parse(formCollection["mes"]));
                String inicio = new DateTime(int.Parse(formCollection["anio"]), int.Parse(formCollection["mes"]), 1).ToString("yyyy-MM-dd");
                String fin = new DateTime(int.Parse(formCollection["anio"]), int.Parse(formCollection["mes"]), dias).ToString("yyyy-MM-dd");
                
                String fechaI = inicio + " 00:00:00";
                String fechaF = fin + " 23:59:59";

                int id = int.Parse(formCollection["id"]);

                BDappwebcontable DbContext = new BDappwebcontable();
                // datos de prueba
                var registros = DbContext.GetReporteAgentes(id,fechaI, fechaF);
                return Json(new { registros = registros});
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }

        [HttpPost]
        public ActionResult reporteAgentesGraficaRango(FormCollection formCollection)
        {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("contador") || Session["rol"].ToString().Equals("administrador"))
            {

                String inicio = formCollection["inicio"];
                String fin = formCollection["final"];

                String fechaI = inicio + " 00:00:00";
                String fechaF = fin + " 23:59:59";

                int id = int.Parse(formCollection["id"]);

                BDappwebcontable DbContext = new BDappwebcontable();

                var registros = DbContext.GetReporteAgentes(id, fechaI, fechaF);
                ViewBag.reportesReg = registros;
                var diasMes = DbContext.GetVentaConteo(id, fechaI, fechaF);
                ViewBag.reportesDias = diasMes;
                var reporteVentas = DbContext.GetReporteGralAgente(id, fechaI, fechaF);
                ViewBag.reportesMes = reporteVentas;


                return Json(new { registros=registros, dias = diasMes, totales = reporteVentas });
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }
        /* editar info paquetes */
        [HttpGet]
        public ActionResult EditarPaquete(int idPaquete)
        {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("administrador"))
            {
                BDappwebcontable DbContext = new BDappwebcontable();
                var detallesPack = DbContext.GetDetallesPaquete(idPaquete);
                ViewBag.paquete = detallesPack;
                return View();
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult actualizarPaquete(FormCollection formCollection)
        {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("administrador"))
            {
                BDappwebcontable DbContext = new BDappwebcontable();
                DbContext.actualizarPaquete(int.Parse(formCollection["id"]),
                    formCollection["paquete"],Double.Parse(formCollection["precioalta"]),
                    Double.Parse(formCollection["preciobaja"]),
                    int.Parse(formCollection["dias"]),formCollection["incluye"],
                    formCollection["itinerario"]);
                return Json(new { success = true });
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }

        /* editar tour */
        [HttpGet]
        public ActionResult EditarTour(int idTour)
        {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("administrador"))
            {
                BDappwebcontable DbContext = new BDappwebcontable();
                var detallesTour = DbContext.GetDetallesTour(idTour);
                ViewBag.tour = detallesTour;
                return View();
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult actualizarTour(FormCollection formCollection)
        {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("administrador"))
            {
                BDappwebcontable DbContext = new BDappwebcontable();
                DbContext.actualizarTour(int.Parse(formCollection["id"]),
                    formCollection["tour"], formCollection["salida"],
                    formCollection["descripcion"], formCollection["horasalida"],
                    formCollection["horaregreso"], formCollection["duracion"],
                    Double.Parse(formCollection["costoalta"]),
                    Double.Parse(formCollection["costobaja"]));
                return Json(new { success = true });
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }
    }
}