namespace appwebcontable.Models
{
    using System;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity;
    using System.Linq;

    public class TVenta
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int id { get; set; }

        public int idUsuario { get; set; }

        public String cliente { get; set; }

        public String correo { get; set; }

        public String telefono { get; set; }

        public String tipoServicio { get; set; }

        public String nombreServicio { get; set; }

        public String tipoPago { get; set; }

        public String fechaInicial { get; set; }

        public String fechaFinal { get; set; }

        public Double total { get; set; }

        public Double anticipo { get; set; }

        public Double saldo { get; set; }

        public String referencia { get; set; }

        public String comentarios { get; set; }

        public String status { get; set; }

        public String fechaRegistro { get; set; }

        public String fechaModificacion { get; set; }


    }

}