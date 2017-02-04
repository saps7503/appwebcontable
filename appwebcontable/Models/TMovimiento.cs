namespace appwebcontable.Models
{
    using System;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity;
    using System.Linq;

    [Table("tmovimientos")]
    public class TMovimiento
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int id { get; set; }

        public int idCuenta { get; set; }

        public int idUsuario { get; set; }

        public string fecha { get; set; }

        public string descripcion { get; set; }

        public string referencia { get; set; }

        public string autorizacion { get; set; }

        public string concepto { get; set; }

        public Double deposito { get; set; }

        public Double retiro { get; set; }

        public Double saldoMXM { get; set; }

        public DateTime fechaRegistro { get; set; }

        public DateTime fechaModificacion { get; set; }
    }

    
}