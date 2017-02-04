using appwebcontable.DAL;
using appwebcontable.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace appwebcontable.Controllers
{
    public class MovimientoController : Controller
    {
        // GET: Movimiento
        public ActionResult Movimiento()
        {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("contador"))
            {
                BDappwebcontable DbContext = new BDappwebcontable();
                ViewBag.nombre = Session["nombre"].ToString();
                var listaCuentas = DbContext.GetCuentas();
                int idU = int.Parse(Session["idUsuario"].ToString());
                int idC = 0;
                if (listaCuentas.Count() > 0)
                {
                    idC = listaCuentas.First().id;
                }
                var listaMovimientos = DbContext.GetMovimientoFecha(idC, idU, DateTime.Today.ToString("yyyy-MM-dd"));
                ViewBag.ContMov = listaMovimientos.Count();
                ViewBag.movimientos = listaMovimientos;
                ViewBag.fecha = DateTime.Today.ToString("yyyy-MM-dd");
                ViewBag.vistaListaCuentas = listaCuentas;
                return View();
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }

        [HttpPost]
        public ActionResult Registrar(FormCollection formCollection) {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("contador"))
            {
                BDappwebcontable DbContext = new BDappwebcontable();
                int idUser = int.Parse(Session["idUsuario"].ToString());
                DbContext.SetMovimiento(int.Parse(formCollection["cuenta"]), idUser, formCollection["fecha"], formCollection["descripcion"]
                    , formCollection["referencia"], formCollection["autorizacion"], formCollection["concepto"],
                    Double.Parse(formCollection["deposito"]), Double.Parse(formCollection["retiro"]),
                    DateTime.Now, DateTime.Now);
                return Json(new {success = true });
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }

        [HttpGet]
        public ActionResult ver() {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("contador"))
            {
                ViewBag.nombre = Session["nombre"].ToString();
                BDappwebcontable DbContext = new BDappwebcontable();
                var listaCuentas = DbContext.GetCuentas();
                ViewBag.vistaListaCuentas = listaCuentas;
                int idCuenta = listaCuentas.First().id;
                var listaMovimientos = DbContext.GetMovimiento(idCuenta);
                ViewBag.vistaListaMovimientos = listaMovimientos;
                
                return View();
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }
        [HttpPost]
        public ActionResult dataMovimiento(FormCollection formCollection) {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("contador"))
            {
                BDappwebcontable DbContext = new BDappwebcontable();
                String id = formCollection["ID"];
                //var cta = DbContext.Movimientos.Find(id);
                var movimiento = DbContext.GetDetallesMov(int.Parse(id));

                return Json(movimiento);
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }
        [HttpPost]
        public ActionResult Filter(FormCollection formCollection) {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("contador"))
            {
                BDappwebcontable DbContext = new BDappwebcontable();
                var filter = DbContext.GetMovimientoFilter(formCollection["fecha"],
                    formCollection["descripcion"], formCollection["retiro"], formCollection["deposito"],
                    formCollection["saldo"],int.Parse(formCollection["idCuenta"]));
                return Json(filter);
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }

        [HttpPost]
        public ActionResult FilterGral(FormCollection formCollection)
        {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("contador"))
            {
                BDappwebcontable DbContext = new BDappwebcontable();
                var filter = DbContext.GetMovimientoFilterGral(formCollection["gral"],
                    int.Parse(formCollection["idCuenta"]));
                return Json(filter);
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }

        [HttpPost]
        public ActionResult verCuentasMov(FormCollection formCollection) {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("contador")) {
                BDappwebcontable DbContext = new BDappwebcontable();
                int idCuenta = int.Parse(formCollection["id"]);
                var listaMovimientos = DbContext.GetMovimiento(idCuenta);
                return Json(listaMovimientos);
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }

        [HttpPost]
        public ActionResult verCuentasMovDia(FormCollection formCollection)
        {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("contador"))
            {
                BDappwebcontable DbContext = new BDappwebcontable();
                int idCuenta = int.Parse(formCollection["id"]);
                int idU = int.Parse(Session["idUsuario"].ToString());
                var listaMovimientos = DbContext.GetMovimientoFecha(idCuenta,idU,DateTime.Today.ToString("yyyy-MM-dd"));
                return Json(listaMovimientos);
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }
    }
}