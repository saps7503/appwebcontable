namespace appwebcontable.Models
{
    using System;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity;
    using System.Linq;

    [Table("tcuentas")]
    public class TCuenta {
        //varchar 700
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int id { get; set; }

        public string referencia { get; set; }

        public string banco { get; set; }

        public string numeroCuenta { get; set; }

        public Double saldoTotal { get; set; }

        public DateTime fechaRegistro { get; set; }

        public DateTime fechaModificacion { get; set; }
    }

    //public class MyEntity
    //{
    //    public int Id { get; set; }
    //    public string Name { get; set; }
    //}
}