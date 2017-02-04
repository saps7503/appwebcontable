using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using appwebcontable.Models;
using appwebcontable.DAL;

namespace appwebcontable.Controllers
{
    public class UsuarioController : Controller
    {
        [HttpGet]
        public ActionResult ver()
        {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("administrador"))
            {
                ViewBag.nombre = Session["nombre"].ToString();
                BDappwebcontable DbContext = new BDappwebcontable();
                var listaUsuarios = DbContext.GetUsuarios();
                ViewBag.vistaListaUsuarios = listaUsuarios;
                ViewBag.temporada = int.Parse(Session["temporada"].ToString());
                return View();
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }
        // GET: Usuario
        public ActionResult Insertar()
        {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("administrador"))
            {
                ViewBag.nombre = Session["nombre"].ToString();
                return View();
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }
        [HttpPost]
        public ActionResult Registrar(FormCollection formCollection) {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("administrador"))
            {
                BDappwebcontable DbContext = new BDappwebcontable();
                DbContext.SetUsuario(formCollection["nombre"], formCollection["apellidos"],
                    formCollection["telefono"], formCollection["email"], formCollection["password"],
                    formCollection["rol"],Double.Parse(formCollection["comision"]), DateTime.Now,
                    DateTime.Now,int.Parse(formCollection["temporada"]));
                return Json(new { success = true });
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }

        [HttpPost]
        public ActionResult EstadoUsuario(FormCollection formCollection)
        {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("administrador"))
            {
                BDappwebcontable DbContext = new BDappwebcontable();
                int idU = int.Parse(formCollection["id"]);
                int st = int.Parse(formCollection["status"]);
                DbContext.SetStatus(idU, st);
                return Json(new { success = true});
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }


        [HttpPost]
        public ActionResult cambioTemporada(FormCollection formCollection) {
            if (Session["autorized"] != null && Session["rol"].ToString().Equals("administrador"))
            {
                BDappwebcontable DbContext = new BDappwebcontable();
                DbContext.cambioTemporada(int.Parse(formCollection["temp"]));
                Session["temporada"] = formCollection["temp"];
                return Json(new { success = true });
            }
            //return Redirect(Url.Action("Index", "Home"));
            return Redirect("../../contabilidad");
        }
    }
}