using appwebcontable.DAL;
using appwebcontable.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace appwebcontable.Controllers
{
    public class CuentaController : Controller
    {
        // GET: Cuenta
        public ActionResult Crear()
        {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("contador"))
            {
                BDappwebcontable DbContext = new BDappwebcontable();
                var listaBancos = DbContext.GetBancos();
                ViewBag.nombre = Session["nombre"].ToString();
                ViewBag.vistaListaBancos = listaBancos;
                return View();
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }


        [HttpPost]
        public ActionResult RegistrarCuenta(FormCollection formCollection)
        {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("contador"))
            {
                BDappwebcontable DbContext = new BDappwebcontable();
                DbContext.SetCuenta(formCollection["alias"], formCollection["banco"], formCollection["numerocuenta"], Double.Parse(formCollection["cantidad"]), DateTime.Now, DateTime.Now);
                return Json(new { success = true });
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }
        [HttpGet]
        public ActionResult ver() {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("contador") || Session["rol"].ToString().Equals("administrador"))
            {
                ViewBag.rol = Session["rol"].ToString();
                ViewBag.nombre = Session["nombre"].ToString();
                BDappwebcontable DbContext = new BDappwebcontable();
                var listaCuentas = DbContext.GetCuentas();
                ViewBag.vistaListaCuentas = listaCuentas;
                return View();
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }
        [HttpPost]
        public ActionResult crearBanco(FormCollection formCollection) {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("contador"))
            {
                BDappwebcontable DbContext = new BDappwebcontable();
                String banco = formCollection["banco"];
                var b = DbContext.GetBancoNombre(banco);
                if (b.Count() > 0)
                {
                    return Json(new { existe = true });
                }
                else
                {
                    DbContext.SetBanco(banco);
                    var listaBancos = DbContext.GetBancos();
                    return Json(listaBancos);
                }
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }
    }
}