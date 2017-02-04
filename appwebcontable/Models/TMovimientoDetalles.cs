namespace appwebcontable.Models
{
    using System;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity;
    using System.Linq;
    
    public class TMovimientoDetalles
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int id { get; set; }

        public string banco { get; set; }

        public string numeroCuenta { get; set; }

        public string fecha { get; set; }

        public string descripcion { get; set; }

        public string referencia { get; set; }

        public string autorizacion { get; set; }

        public string concepto { get; set; }

        public Double deposito { get; set; }

        public Double retiro { get; set; }

        public Double saldoMXM { get; set; }

        public string fechaRegistro { get; set; }

        public string fechaModificacion { get; set; }
        
        public string nombre { get; set; }

        public string apellidos { get; set; }
    }

    
}