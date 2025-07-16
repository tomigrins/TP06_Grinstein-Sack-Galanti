using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP02.Models;

namespace TP02.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }
    public IActionResult Index(){
        return View();
    }
    public IActionResult ValidarUsuario(string usuario, string clave){
        int id = BD.Login(usuario, clave);

        if(id == 0){
            ViewBag.segundoIntento = true;
            return View ("SignIn");
        }
        else{
            HttpContext.Session.SetString("usuario", Objetos.ObjectToString(BD.GetUsuario(id)));
            ViewBag.usuario = BD.GetUsuario(id);
            return View("Index");
        }
    }
    public IActionResult SignIn(){
        ViewBag.segundoIntento = false;
        return View();
    }
    public IActionResult Desloguearse(){
        HttpContext.Session.Remove("usuario");
        return View("Index");
    }
    public IActionResult DatoFamiliar(){
        Usuario usuario = Objetos.StringToObject<Usuario>(HttpContext.Session.GetString("usuario"));
        int id = usuario.Id;
        List<DatoFamiliar> familiares = BD.GetDatoFamiliar(id);
        ViewBag.familiares = familiares;
        return View("infoDatosFamiliar");
    }
    public IActionResult DatoInteres(){
        Usuario usuario = Objetos.StringToObject<Usuario>(HttpContext.Session.GetString("usuario"));
        int id = usuario.Id;
        List<DatoInteres> intereses = BD.GetDatoInteres(id);
        ViewBag.intereses = intereses;
        return View("infoDatosIntereses");
    }

}
