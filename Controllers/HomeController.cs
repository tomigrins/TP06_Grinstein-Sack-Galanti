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
    // public IActionResult ValidarCuenta(string Email, string Contraseña){
    //     int idUsuario = BD.Login(Email, Contraseña);
    //     new Usuari
    // }
    public IActionResult Desloguearse(){
        HttpContext.Session.Remove("usuario");
        return View("Index");
    }




    // public IActionResult Index()
    // {
    //     Grupo.InicializarGrupo();
    //     ViewBag.Integrantes = Grupo.Integrantes;
    //     return View();
    // }
    // public IActionResult SelectIntegrante(int dni){
    //     if(Grupo.Integrantes.ContainsKey(dni)){
    //     ViewBag.DatosPersonales = Grupo.Integrantes[dni].DatosPersonales;
    //     ViewBag.DNI = dni;
    //     }
    //     return View("infoDatosPersonales"); 
    // }
    // public IActionResult MostrarDatosFamiliares(int dni){
    //     if(Grupo.Integrantes.ContainsKey(dni)){
    //     ViewBag.DatosPersonales = Grupo.Integrantes[dni].DatosPersonales;
    //     ViewBag.DatosFamiliares = Grupo.Integrantes[dni].DatosFamiliares;
    //     }
    //     return View("infoDatosFamiliares");
    // }
    // public IActionResult MostrarDatosInteres(int dni){
    //     if(Grupo.Integrantes.ContainsKey(dni)){
    //     ViewBag.DatosPersonales = Grupo.Integrantes[dni].DatosPersonales;
    //     ViewBag.DatosIntereses = Grupo.Integrantes[dni].DatosIntereses;
    //     }
    //     return View("infoDatosIntereses");
    // }

}
