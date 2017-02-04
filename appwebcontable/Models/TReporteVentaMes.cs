namespace appwebcontable.Models
{
    using System;
    using System.Data.Entity;
    using System.Linq;

    public class TReporteVentaMes
    {
    
        public int id { get; set; }
        
        public String agente { get; set; }
        
        public Double total { get; set; }
        
        public Double totalpagado { get; set; }
        
        public Double diferencia { get; set; }  
    }
    
}