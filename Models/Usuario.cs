public class Usuario{
    int Id {get;  set;}
    public string Nombre;
    string Apellido{ get;  set; }
    string Email {get;  set;}
    string Contraseña {get;  set;}
    DateTime FechaNacimiento { get;  set; }
    string Foto {get;  set;}
    int ObtenerEdad(){
        var hoy = DateTime.Today;
        int edad = hoy.Year - FechaNacimiento.Year;

        if (FechaNacimiento.Date > hoy.AddYears(-edad))
        {
            edad--;
        }

        return edad;
    }
}