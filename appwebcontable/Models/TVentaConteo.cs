namespace appwebcontable.Models
{
    using System;
    using System.Data.Entity;
    using System.Linq;

    public class TVentaConteo
    {
        public int cont { get; set; }
        
        public String fecha { get; set; }

        public string formatFecha()
        {
            string DateTime = string.Format("{0:yyyy-MM-dd}", Convert.ToDateTime(fecha));
            return DateTime;
        }
    }
    
}