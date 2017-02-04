namespace appwebcontable.Models
{
    using System;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity;
    using System.Linq;

    public class TTour
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int id_tour { get; set; }

        public String tour { get; set; }

        public String saliendo { get; set; }

        public String descripcion { get; set; }

        public String horario_salida { get; set; }

        public String horario_regreso { get; set; }

        public String duracion { get; set; }

        public Double costo_alta { get; set; }

        public Double costo_baja { get; set; }

        public int temporada { get; set; }

        public int estatus { get; set; }


        public String formatHsalida()
        {
            if(horario_salida.CompareTo("-") == 0)
            {
                return "00:00";
            }
            DateTime dt = DateTime.Parse(horario_salida);
            return dt.ToString("HH:mm"); ;
        }
        public String formatHregreso()
        {
            if (horario_regreso.CompareTo("-") == 0)
            {
                return "00:00";
            }
            DateTime dt = DateTime.Parse(horario_regreso);
            return dt.ToString("HH:mm"); ;
        }

        public int formatDuracion()
        {
            if (duracion.CompareTo("-") == 0)
            {
                return 0;
            }
            String[] hr = duracion.Split(' ');
            return int.Parse(hr[0]);
        }
    }
}