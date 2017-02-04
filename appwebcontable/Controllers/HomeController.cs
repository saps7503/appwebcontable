using appwebcontable.DAL;
using appwebcontable.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace appwebcontable.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            if (Session["autorized"] != null)
            {
                if (Session["rol"].ToString().Equals("contador"))
                {
                    return Redirect(Url.Action("Contador", "Home"));
                }else if (Session["rol"].ToString().Equals("administrador"))
                {
                    return Redirect(Url.Action("Administrador", "Home"));
                }else if (Session["rol"].ToString().Equals("agente de ventas"))
                {
                    return Redirect(Url.Action("AgenteVentas", "Home"));
                }
            }
            return View();
        }
        [HttpPost]
        public ActionResult LogIn(FormCollection formCollection) {
            BDappwebcontable DbContext = new BDappwebcontable();
            var user = DbContext.LogIn(formCollection["email"], formCollection["password"]);
            if (user.Count() > 0)
            {
                Session["autorized"] = true;
                Session["idUsuario"] = user.ElementAt(0).id;
                Session["nombre"] = user.ElementAt(0).nombre;
                Session["apellidos"] = user.ElementAt(0).apellidos;
                Session["telefono"] = user.ElementAt(0).telefono;
                Session["email"] = user.ElementAt(0).email;
                Session["rol"] = user.ElementAt(0).rol;
                Session["comision"] = user.ElementAt(0).comision;
                Session["temporada"] = user.ElementAt(0).temporada;
            }
            else {
                return Json(new { autorized =  false });
            }
            return Json(user);
        }

        [HttpGet]
        public ActionResult Contador() {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("contador"))
            {
                ViewBag.nombre = Session["nombre"].ToString();
                return View();
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }

        [HttpGet]
        public ActionResult Administrador()
        {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("administrador"))
            {
                ViewBag.nombre = Session["nombre"].ToString();
                return View();
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }

        [HttpGet]
        public ActionResult AgenteVentas()
        {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("agente de ventas"))
            {
                ViewBag.nombre = Session["nombre"].ToString();
                return View();
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }
        [HttpGet]
        public ActionResult CerrarSesion() {
            HttpContext.Session.Clear();
            return Redirect("../../contabilidad");
            //return Redirect(Url.Action("Index", "Home"));
        }
    }
}