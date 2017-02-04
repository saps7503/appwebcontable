namespace appwebcontable.Models
{
    using System;
    using System.Data.Entity;
    using System.Linq;

    public class TReporteAgente
    {
        public String fecha { get; set; }

        public string formatFecha()
        {
            string DateTime = string.Format("{0:yyyy-MM-dd}", Convert.ToDateTime(fecha));
            return DateTime;
        }

        public Double total { get; set; }

        public Double anticipo { get; set; }

        public Double saldo { get; set; }

        public Double totalventa { get; set; }

        public Double totalpagado { get; set; }

        public Double diferencia { get; set; }
    }
    
}