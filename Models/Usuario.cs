public class Usuario{
    public int Id {get; set;}
    public string Nombre {get;  set;}
    public string Apellido{ get;  set; }
    public string Email {get;  set;}
    public string Contraseña {get;  set;}
    public DateTime FechaNacimiento { get;  set; }
    public string Foto {get;  set;}
    public int ObtenerEdad(){
        var hoy = DateTime.Today;
        int edad = hoy.Year - FechaNacimiento.Year;

        if (FechaNacimiento.Date > hoy.AddYears(-edad))
        {
            edad--;
        }

        return edad;
    }
}