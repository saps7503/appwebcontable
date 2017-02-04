namespace appwebcontable.Models
{
    using System;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity;
    using System.Linq;

    
    [Table("tusuarios")]
    public class TUsuario {

        [Key,DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int id { get; set; }

        public string nombre { get; set; }  

        public string apellidos { get; set; }  

        public string telefono { get; set; }

        public string email { get; set; }

        public string password { get; set; }

        public string rol { get; set; }

        public Double comision { get; set; }

        public int temporada { get; set; }

        public int status { get; set; }

        public DateTime fechaRegistro { get; set; }

        public DateTime fechaModificacion { get; set; }

        
    }

    //public class MyEntity
    //{
    //    public int Id { get; set; }
    //    public string Name { get; set; }
    //}
}