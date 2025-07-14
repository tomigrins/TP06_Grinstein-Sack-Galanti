namespace TP02.Models;
using Microsoft.Data.SqlClient;
using Dapper;

public static class BD
{
    private static string _connectionString = @"Server=localhost; DataBase=BD; Integrated Security=True; TrustServerCertificate=True;";

    public static int Login(string email, string contraseña){
        int Id = -1;
        using(SqlConnection connection = new SqlConnection(_connectionString)){
            string query = "SELECT Id FROM Usuario WHERE Email = email AND Contraseña = contraseña";
            Id = connection.QueryFirstOrDefault<int>(query, new {Email = email, Contraseña = contraseña});
        }
        return Id; //Devuelve -1 si no lo encontro. sino la id del usuario.
    }
    public static Usuario GetUsuario(int id){
        Usuario usuario = null;
        using(SqlConnection connection = new SqlConnection(_connectionString)){
            string query = "SELECT * FROM Usuario WHERE Id = id";
            usuario = connection.QueryFirstOrDefault<Usuario>(query, new {Id = id});
        }
        return usuario; //Lo mismo que Login
    }
    public static List<DatoFamiliar> GetDatoFamiliar(int id){
        List<DatoFamiliar> datoFamiliar = new List<DatoFamiliar>();
        using(SqlConnection connection = new SqlConnection(_connectionString)){
            string query = "SELECT * FROM DatoFamiliar WHERE IdUsuario = id";
            datoFamiliar = connection.Query<DatoFamiliar>(query).ToList();
        }
        return datoFamiliar; //Si no existe devuelve la lista vacia
    }
    public static List<DatoInteres> GetDatoInteres(int id){
        List<DatoInteres> datoInteres = new List<DatoInteres>();
        using(SqlConnection connection = new SqlConnection(_connectionString)){
            string query = "SELECT * FROM DatoFamiliar WHERE IdUsuario = id";
            datoInteres = connection.Query<DatoInteres>(query).ToList();
        }
        return datoInteres; //Lo mismo que GetDatoFamiliar
    }
    } 
