namespace appwebcontable.Models
{
    using System;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity;
    using System.Linq;

    public class TCotizaciones
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int id { get; set; }

        public int idAgente { get; set; }

        public String cliente { get; set; }

        public String clienteCorreo { get; set; }

        public String direccion { get; set; }

        public String mensaje { get; set; }

        public String urlPdf { get; set; }

        public String fechaRegistro { get; set; }

        public String fechaModificacion { get; set; }

    }
    
}