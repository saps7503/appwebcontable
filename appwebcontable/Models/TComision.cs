namespace appwebcontable.Models
{
    using System;
    using System.Data.Entity;
    using System.Linq;

    public class TComision
    {
        public String cliente { get; set; }

        public String venta { get; set; }

        public Double total { get; set; }

        public Double comision { get; set; }

        public String status { get; set; }
       
    }
    
}