namespace appwebcontable.Models
{
    using System;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity;
    using System.Linq;

    [Table("tpaquetes")]
    public class TPaquete
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int id { get; set; }

        public string nombre { get; set; }

        public Double costo_alta { get; set; }

        public Double costo_baja { get; set; }

        public int dias { get; set; }

        public String incluye { get; set; }

        public String itinerario { get; set; }

        public int estatus { get; set; }

    }
      
}