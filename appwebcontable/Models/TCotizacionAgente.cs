namespace appwebcontable.Models
{
    using System;
    using System.Data.Entity;
    using System.Linq;

    public class TCotizacionAgente : DbContext
    {
        public int cotizaciones { get; set; }

        public DateTime fechaRegistro { get; set; }

        public string formatFecha()
        {
            string DateTime = string.Format("{0:yyyy-MM-dd}", fechaRegistro);
            return DateTime;
        }
    }
    
}