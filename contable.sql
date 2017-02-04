CREATE DATABASE  IF NOT EXISTS `contable` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `contable`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: contable
-- ------------------------------------------------------
-- Server version	5.0.20-nt

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Not dumping tablespaces as no INFORMATION_SCHEMA.FILES table on this server
--

--
-- Table structure for table `cat_tours_new`
--

DROP TABLE IF EXISTS `cat_tours_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_tours_new` (
  `id_tour` int(11) NOT NULL auto_increment,
  `id_categoria_tour` int(4) default '0',
  `tipo` char(1) default 'C' COMMENT 'C - Colectivo\r\nE - Especial',
  `tour` varchar(150) default '-',
  `saliendo` varchar(20) default '?',
  `num_dias` int(2) default '1',
  `min_pax` int(2) default '2' COMMENT 'Como minimo para dos personas',
  `descripcion` text,
  `horario_salida` varchar(15) default '-',
  `horario_regreso` varchar(15) default '-',
  `duracion` varchar(15) default '-',
  `lunes` char(1) default '-',
  `martes` char(1) default '-',
  `miercoles` char(1) default '-',
  `jueves` char(1) default '-',
  `viernes` char(1) default '-',
  `sabado` char(1) default '-',
  `domingo` char(1) default '-',
  `km` decimal(12,3) default '0.000',
  `gas` double(12,2) default '0.00',
  `viaticos` double(12,2) default '0.00',
  `dpiso` double(12,2) default '0.00',
  `estacionamiento` double(12,2) default '0.00',
  `casetas` double(12,2) default '0.00',
  `guia` double(12,2) default '0.00',
  `entradas` double(12,2) default '0.00',
  `costo_alta` double(12,2) default '0.00',
  `costo_baja` double(12,2) default '0.00',
  `temporada` int(1) default '1',
  `estatus` int(1) default '1',
  `imagen` varchar(300) default '-',
  `color` varchar(20) default '-',
  PRIMARY KEY  (`id_tour`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_tours_new`
--

LOCK TABLES `cat_tours_new` WRITE;
/*!40000 ALTER TABLE `cat_tours_new` DISABLE KEYS */;
INSERT INTO `cat_tours_new` VALUES (1,3,'C','Canon / Chiapa de Corzo','San Cristobal',1,2,'Este tour te hará vivir una experiencia extraordinaria recorriendo el impresionante Cañón del Sumidero en lancha por el Rio Grijalva, y visitando Chiapa de Corzo, considerada Ciudad Colonial y Pueblo Mágico. Hora de salida: 10:00 am - Regreso aproximadamente: 5:00 pm  Incluye : Traslado redondo saliendo desde San Cristóbal, Paseo en lancha recorriendo el río Grijalva, Entradas, Lancha colectiva en el Cañón del Sumidero, Recorrido por Chiapa de Corzo','08:00 am','03:00 pm','08 Hrs','S','N','S','N','S','N','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,350.00,300.00,2,1,'~/Images/canon_chiapa.jpg','VERDE'),(2,1,'C','Lagos de Montebello y Chiflon','San Cristobal',1,2,'Un viaje hacia la Depresión Central de Chiapas, donde el Río San Vicente cae formando las Cascadas del Chiflón; posteriormente visitaremos Los Lagos de colores de Montebello. Hora de salida: 8:00 am - Regreso aproximadamente: 9:00 pm - Incluye : Traslado saliendo desde San Cristóbal, Tour a los lagos de Montebello,Recorrido por la cascada de El Chiflón, Entradas.','08:00 am','08:00 pm','12 Hrs','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,400.00,350.00,2,1,'~/Images/chiflon_lagos.jpg','CELESTE'),(3,2,'C','Pueblos Indigenas : Chamula - Zinacantan','San Cristobal',1,2,'Te invitamos a conocer la milenaria historia y cultura de los pueblos mayas de Chiapas. Esta visita será un acercamiento a la profundidad de la tradición mágica y mística de los pueblos autóctonos de Chamula y Zinacantán. A escasos 15 km. de San Cristóbal de Las Casas, ambos pueblos guardan celosamente sus tradiciones ancestrales que contrastan con el Chiapas moderno. Hora de salida: 9:00 am - Regreso aproximadamente: 1:00 pm - Incluye : Traslado redondo saliendo desde San Cristóbal, Entradas a las comunidades, Convivencia con una familia autóctona.','08:00 am','01:00 pm','06 Hrs','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,250.00,200.00,2,1,'~/Images/chamula_zinacantan.jpg','ROSA'),(4,1,'C','Palenque- Agua Azul y Misolha (SCLC)','San Cristobal',1,2,'Un fantástico recorrido por lugares insólitos, llenos de atractivo visual, vida natural, cascadas y selva, que aún guarda los secretos de la esplendorosa ciudad de Palenque; donde experimentarás transportarte al pasado en alas de la imaginación mientras caminas entre los antiguos edificios descubiertos de finales del siglo XVIII. Una vivencia sin igual. La magia de viajar a escenarios fascinantes a tu alcance. Hora de salida: 5:00 am - Regreso aproximadamente: 10:30 pm. Incluye : Traslado saliendo desde San Cristóbal, Entrada a la zona arqueológica de Palenque, Recorrido por las cascadas de Agua Azul y Misol-ha, Comida Buffete.','05:00 am','09:00 pm','16 Hrs','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,500.00,450.00,2,1,'~/Images/aguazul_msha_pqe.jpg','NARANJA'),(5,1,'C','Palenque- Agua Azul y Misolha (Comida)','San Cristobal',1,2,NULL,'05:00 am','09:00 pm','16 Hrs','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,650.00,600.00,2,1,'-','NARANJA'),(6,1,'C','Transfer Apto Tgz - Hotel SCLC','Aeropuerto Tgz',0,4,NULL,'-','-','-','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1000.00,800.00,2,1,'-','-'),(7,1,'E','Transfer Hotel SCLC - Apto Tgz','AEROPUERTO TGZ',0,4,NULL,'-','-','-','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1000.00,800.00,1,1,'-','-'),(8,1,'C','Palenque- Agua Azul y Misolha (PLQ)','Palenque',1,2,NULL,'10:00 am','12:00 pm','06 Hrs','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,600.00,550.00,1,1,'-','-'),(9,1,'C','Selva Lacandona-Yaxchilan y Bonampak','Palenque',1,2,'En este recorrido te invitamos a conocer en dos días, dos de las zonas arqueológicas mayas más impresionantes del clásico mesoamericano, llenas de cultura y rodeadas de exuberante naturaleza. Yaxchilán, ciudad edificada en el margen del río Usumacinta y Bonampak, localizada en el corazón de la selva Lacandona, ciudad maya famosa por sus pinturas murales. Disfruta una caminata matinal por senderos de selva alta en la reserva de los montes Azules, conoce su impresionante flora y fauna. Convive con lacandones y déjate maravillar con su estilo de vida y costumbres. Hora de salida: 6:00 am - Regreso aproximadamente: 8:00 pm - Incluye: Traslado saliendo desde Palenque, Transportación a los lugares mencionados, Entradas a los lugares descritos,Noche de hospedaje en Lacanjá, Desayuno, comida y cena, Guía Lacandón','06:00 am','07:00 pm','13 Hrs','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,900.00,850.00,1,1,'~/Images/yaxc_bpak_selva.jpg','CYAN'),(10,1,'C','Selva Lacandona-Yaxchilan y Bonampak(Sendero)','Palenque',2,2,'En este recorrido te invitamos a conocer en dos días, dos de las zonas arqueológicas mayas más impresionantes del clásico mesoamericano, llenas de cultura y rodeadas de exuberante naturaleza. Yaxchilán, ciudad edificada en el margen del río Usumacinta y Bonampak, localizada en el corazón de la selva Lacandona, ciudad maya famosa por sus pinturas murales. Disfruta una caminata matinal por senderos de selva alta en la reserva de los montes Azules, conoce su impresionante flora y fauna. Convive con lacandones y déjate maravillar con su estilo de vida y costumbres. Hora de salida: 6:00 am - Regreso aproximadamente: 8:00 pm - Incluye: Traslado saliendo desde Palenque, Transportación a los lugares mencionados, Entradas a los lugares descritos,Noche de hospedaje en Lacanjá, Desayuno, comida y cena, Guía Lacandón','06:00 am','07:00 pm','26 Hrs','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1800.00,1700.00,1,1,'~/Images/yaxc_bpak_selva.jpg','CYAN'),(11,1,'C','Hotel Axkan Palenque - Apto Villahermosa','Palenque',0,4,NULL,'-','-','-','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1700.00,1600.00,1,1,'~/Images/aeropuerto_hotel.jpg','AMARILLO'),(12,1,'E','Ruta de la Marimba','San Cristobal',1,4,NULL,'09:00 am','09:00 pm','12 Hrs','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,0,'-','-'),(20,1,'E','Ruta de los Textiles','San Cristobal',1,11,NULL,'08:00 am','04:00 pm','08 Hrs','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,0,'-','-'),(23,1,'E','Ruta del Chiflon Tenam-Puente','San Cristobal',1,11,NULL,'08:00 am','08:00 pm','12 Hrs','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,0,'-','-'),(26,1,'E','Ruta Lagos y Chincultik','San Cristobal',1,11,NULL,'08:00 am','08:00 pm','12 Hrs','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,0,'-','-'),(29,1,'E','Ruta Aves y Naturaleza','San Cristobal',1,11,NULL,'04:00 am','06:00 pm','14 Hrs','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,0,'-','-'),(32,1,'E','Ruta Costa','San Cristobal',1,11,NULL,'07:00 am','08:00 pm','11 Hrs','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,0,'-','-'),(38,1,'E','Ruta del Cafe- Soconusco','San Cristobal',2,11,NULL,'-','-','-','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,0,'-','-'),(41,1,'E','Ruta Guacamayas y Nubes','San Cristobal',2,11,NULL,'-','-','-','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,600.00,600.00,1,1,'-','-'),(47,1,'E','Ruta Maya','San Cristobal',2,11,NULL,'06:00 am','08:00 pm','14 Hrs','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,0,'-','-'),(54,1,'E','Ruta Tonina','San Cristobal',1,4,NULL,'07:00 am','07:00 pm','12 Hrs','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,0,'-','-'),(57,1,'E','Ruta del Ambar','San Cristobal',1,4,NULL,'07:00 am','06:00 pm','11 Hrs','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,0,'-','-'),(65,3,'E','Catazaja','Palenque',1,11,NULL,'09:00 am','02:00 pm','05 Hrs','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,0,'-','-'),(66,1,'E','Tonina-Agua Azul-Mishol-Ha','Palenque',1,4,NULL,'06:30 am','06:00 pm','12 Hrs','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,0,'-','-'),(69,1,'C','Aluxes','Palenque',1,4,NULL,'09:00 am','15:00 pm','06 Hrs','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,0,'-','-'),(72,3,'E','Cascada Roberto Barrios','Palenque',1,4,NULL,'09:00 am','01:00 pm','08 Hrs','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,0,'-','-'),(77,1,'E','Welib- Ja','Palenque',1,11,NULL,'07:00 am','07:00 pm','12 Hrs','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,0,'-','-'),(80,1,'E','Visita tumba Pakal','Palenque',1,11,NULL,'-','-','-','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,0,'-','-'),(83,2,'E','Cancaja','Palenque',1,11,NULL,'09:00 am','09:00 pm','12 Hrs','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,0,'-','-'),(86,2,'E','Calakmul','Palenque',1,11,NULL,'06:00 am','10:00 pm','16 Hrs','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,0,'-','-'),(87,1,'C','Aeropuerto-Pueblos-San Cristobal','AEROPUERTO TGZ',0,3,NULL,'01:00 am','03:00 am','-','N','S','N','N','N','N','N',0.000,600.00,0.00,250.00,30.00,98.00,0.00,35.00,750.00,550.00,2,1,'~/Images/aeropuerto_hotel.jpg','AMARILLO'),(89,1,'C','Aeropuerto-Hotel (San Cristobal)','AEROPUERTO TGZ',1,2,'Salidas : 8:00am, 8:30am,12:00,13:00, 15:00, 16:00, 18:00.','-','-','-','S','N','S','N','S','N','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1000.00,800.00,1,1,'~/Images/aeropuerto_hotel.jpg','AMARILLO'),(91,1,'C','Aeropuerto-Canon-San Cristobal','AEROPUERTO TGZ',1,2,NULL,'-','-','-','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,0,'~/Images/aeropuerto_hotel.jpg','AMARILLO'),(92,1,'C','Agua Azul- Mishol Ha y Palenque','San Cristobal',1,2,NULL,'05:00 am','10:00 pm','17 Hrs','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,0,'-','-'),(93,2,'C','Aluxes- Regreso San Cristobal','Palenque',1,2,NULL,'12:00 am','02:00 pm','06 Hrs','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,0,'-','-'),(94,3,'E','Chorreadero','San Cristobal',1,2,NULL,'-','-','-','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,0,'-','-'),(95,3,'E','Guacamayas y Nubes','San Cristobal',1,2,NULL,'-','-','-','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,0,'-','-'),(96,3,'C','Hotel (San Cristobal) - Aeropuerto','San Cristobal',1,2,'Salidas : 8:00am, 8:30am,12:00,13:00, 15:00, 16:00, 18:00.','-','--','-','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1000.00,800.00,1,1,'~/Images/aeropuerto_hotel.jpg','AMARILLO'),(98,3,'C','Hotel (San Cristobal)- Pueblos - Aeropuerto','San Cristobal',1,2,NULL,'-','-','-','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,0,'~/Images/aeropuerto_hotel.jpg','AMARILLO'),(99,3,'E','Kayak - Rio Fogotico','San Cristobal',1,2,NULL,'-','-','-','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,0,'-','-'),(100,1,'E','Mamut y Rancho Nuevo','San Cristobal',1,2,NULL,'-','-','-','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,0,'-','-'),(101,1,'C','City Tour San Cristobal','San Cristobal',1,2,NULL,'-','-','-','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,0,'-','-'),(102,1,'E','Ruta de las Nubes','San Cristobal',1,2,NULL,'-','-','-','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,0,'-','-'),(103,1,'E','Ruta del Cafe - Altos','San Cristobal',1,2,NULL,'-','-','-','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,0,'-','-'),(104,1,'E','Ruta Tenam -Puente y Chiflon','San Cristobal',1,2,NULL,'-','-','-','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,0,'-','-'),(105,1,'C','Yaxchilan-Bonampak','Palenque',1,2,'En este recorrido te invitamos a conocer dos de las zonas arqueológicas mayas más impresionantes, llenas de cultura y rodeadas de naturaleza paradisiaca. Yaxchilán, ciudad edificada en el margen del río Usumacinta, notable por la gran cantidad de esculturas en piedra. Bonampak, localizada en el corazón de la selva Lacandona, famosa por las pinturas que le dan su nombre \"murales pintados\" - Hora de salida: 6:00 am - Regreso aproximadamente: 7:00 pm - Incluye : Traslado saliendo desde Palenque,Transportación a los lugares mencionados, Entradas a los lugares descritos, Desayuno buffete y comida.','06:00 am','07:00 pm','13 Hrs','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,0,'~/Images/yaxc_bpak.jpg','CYAN'),(106,1,'E','Sima de las Cotorras','San Cristobal',1,2,NULL,'-','-','-','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,0,'-','-'),(107,1,'C','Tour Museo La Venta','Palenque',1,2,NULL,'09:00 am','03:00 pm','06 Hrs','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,0,'-','-'),(108,1,'C','Yaxchilan','San Cristobal',1,2,NULL,'08:00 am','20:00 pm','12 Hrs','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,0,'-','-'),(109,1,'E','Boca del Cielo','San Cristobal',1,2,NULL,'-','-','-','S','S','S','S','S','S','S',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,0,'-','-'),(110,3,'C','Transfer Palenque a San Cristobal (Colectivo)','Palenque',1,2,'Transfer Palenque a San Cristobal colectivo','-','-','-','-','-','-','-','-','-','-',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,0,'-','-'),(111,0,'C','Cañón del Sumidero y Chiapa de Corzo','San Cristobal',1,2,'cañon','09:01','16:01','6 Hrs','-','-','-','-','-','-','-',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1500.00,1250.00,1,1,'-','-'),(112,0,'C','tour de prueba','tyhjhh',1,2,'<p>hola&nbsp;</p>\n','14:00','16:00','2 Hrs','-','-','-','-','-','-','-',0.000,0.00,0.00,0.00,0.00,0.00,0.00,0.00,3456.00,2333.00,1,1,'-','-');
/*!40000 ALTER TABLE `cat_tours_new` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbancos`
--

DROP TABLE IF EXISTS `tbancos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbancos` (
  `id` int(11) NOT NULL auto_increment,
  `nombre` varchar(60) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbancos`
--

LOCK TABLES `tbancos` WRITE;
/*!40000 ALTER TABLE `tbancos` DISABLE KEYS */;
INSERT INTO `tbancos` VALUES (1,'Santander'),(2,'Bancomer'),(3,'Banamex');
/*!40000 ALTER TABLE `tbancos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcomisiones`
--

DROP TABLE IF EXISTS `tcomisiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcomisiones` (
  `id` int(11) NOT NULL auto_increment,
  `idAgente` int(11) default NULL,
  `idVenta` int(11) default NULL,
  `venta` double default NULL,
  `comision` double default NULL,
  `status` varchar(45) default NULL,
  `fechaRegistro` datetime default NULL,
  `fechaModificacion` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcomisiones`
--

LOCK TABLES `tcomisiones` WRITE;
/*!40000 ALTER TABLE `tcomisiones` DISABLE KEYS */;
INSERT INTO `tcomisiones` VALUES (1,5,1,1000,30,'Aprobada','2016-12-26 20:51:10','2016-12-26 20:51:10'),(2,3,2,2800,140,'Aprobada','2016-12-27 11:35:18','2016-12-27 11:35:18'),(3,3,3,1000,50,'Aprobada','2016-12-27 15:10:49','2016-12-27 15:10:49'),(4,5,4,2800,84,'Aprobada','2016-12-28 10:31:28','2016-12-28 10:31:28'),(5,6,5,2800,42,'Aprobada','2016-12-28 19:54:03','2016-12-28 19:54:03'),(6,7,6,2800,112,'Aprobada','2016-12-29 14:29:08','2016-12-29 14:29:08'),(7,5,7,1000,30,'No aprobada','2016-12-30 14:57:52','2016-12-30 14:57:52'),(8,3,8,2800,140,'No aprobada','2017-01-01 19:49:08','2017-01-01 19:49:08'),(9,3,9,2800,140,'No aprobada','2017-01-01 20:01:12','2017-01-01 20:01:12'),(10,3,10,2800,140,'No aprobada','2017-01-01 20:12:02','2017-01-01 20:12:02'),(11,3,12,2800,140,'Aprobada','2017-01-01 20:27:41','2017-01-01 20:27:41'),(12,3,13,2800,140,'No aprobada','2017-01-03 11:55:16','2017-01-03 11:55:16'),(13,3,14,1000,50,'Aprobada','2017-01-03 11:56:31','2017-01-03 11:56:31'),(14,3,15,2800,140,'Aprobada','2017-01-03 12:00:19','2017-01-03 12:00:19');
/*!40000 ALTER TABLE `tcomisiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcotizaciones`
--

DROP TABLE IF EXISTS `tcotizaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcotizaciones` (
  `id` int(11) NOT NULL auto_increment,
  `idAgente` int(11) default NULL,
  `cliente` varchar(80) default NULL,
  `clienteCorreo` varchar(80) default NULL,
  `direccion` varchar(200) default NULL,
  `mensaje` text,
  `urlPdf` text,
  `fechaRegistro` datetime default NULL,
  `fechaModificacion` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcotizaciones`
--

LOCK TABLES `tcotizaciones` WRITE;
/*!40000 ALTER TABLE `tcotizaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcotizaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcuentas`
--

DROP TABLE IF EXISTS `tcuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcuentas` (
  `id` int(11) NOT NULL auto_increment,
  `referencia` varchar(45) default NULL,
  `banco` varchar(45) default NULL,
  `numeroCuenta` varchar(45) default NULL,
  `saldoTotal` double default NULL,
  `fechaRegistro` datetime default NULL,
  `fechaModificacion` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcuentas`
--

LOCK TABLES `tcuentas` WRITE;
/*!40000 ALTER TABLE `tcuentas` DISABLE KEYS */;
INSERT INTO `tcuentas` VALUES (1,'Banamex 1','Banamex','1234 1234 1234 1323',4125,'2016-12-10 10:26:42','2016-12-12 20:37:10'),(2,'Santander 1','Santander','3456 7654 7889 6687',4366.7,'2016-12-10 10:27:22','2016-12-14 10:50:23'),(4,'Bancomer 1','Bancomer','34455 6756756',1000,'2016-12-12 20:58:30','2016-12-12 20:58:30'),(5,'Santander 2','Santander','0000 0000 0000 0000',8997.69,'2016-12-13 09:33:35','2016-12-28 10:35:25'),(6,'Banamex 2','Banamex','34455 6756756545',34545,'2016-12-13 12:45:40','2016-12-13 12:45:40'),(7,'santader 3','Santander','2323',3000,'2016-12-13 14:25:55','2016-12-14 10:45:52');
/*!40000 ALTER TABLE `tcuentas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmovimientos`
--

DROP TABLE IF EXISTS `tmovimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmovimientos` (
  `id` int(11) NOT NULL auto_increment,
  `idCuenta` int(11) default NULL,
  `idUsuario` int(11) default NULL,
  `fecha` varchar(40) default NULL,
  `descripcion` varchar(60) default NULL,
  `referencia` varchar(20) default NULL,
  `autorizacion` varchar(20) default NULL,
  `concepto` varchar(60) default NULL,
  `deposito` double default NULL,
  `retiro` double default NULL,
  `saldoMXM` double default NULL,
  `fechaRegistro` datetime default NULL,
  `fechaModificacion` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmovimientos`
--

LOCK TABLES `tmovimientos` WRITE;
/*!40000 ALTER TABLE `tmovimientos` DISABLE KEYS */;
INSERT INTO `tmovimientos` VALUES (1,2,1,'2016-12-07','ventas','0001072502 ','0001072502 ','venta de tour',1000,300,4000,'2016-12-11 19:13:06','2016-12-11 19:13:06'),(3,1,1,'2016-12-02','DEPOSITO VENTAS NETAS D TAR POR EVOPAYMX ','4001072502 ','0001072502 ','ventas netas',50,25,4125,'2016-12-12 20:37:10','2016-12-12 20:37:10'),(4,5,1,'2016-12-13','compra de equipo','4001072502 ','0001072502 ','compra',5000,200,15497.69,'2016-12-13 13:54:12','2016-12-13 13:54:12'),(5,7,1,'2016-12-13','venta de sistema','3456788','57657567','ventas sist.',2000,0,3000,'2016-12-14 10:45:52','2016-12-14 10:45:52'),(6,5,1,'2016-12-14','compra de sis','5667567','65756756','venta',0,3500,11997.69,'2016-12-14 10:48:43','2016-12-14 10:48:43'),(7,2,1,'2016-12-14','compra de equipo','0001072503','0001072502 ','compra',500,133.3,4366.7,'2016-12-14 10:50:23','2016-12-14 10:50:23'),(8,5,1,'2016-12-21','compra de equipo','4001072502 ','57657567','compra',0,5000,6997.69,'2016-12-21 11:27:14','2016-12-21 11:27:14'),(9,5,1,'2016-12-28','venta de tour','010101010','57657567','venta total de un tour',2000,0,8997.69,'2016-12-28 10:35:25','2016-12-28 10:35:25');
/*!40000 ALTER TABLE `tmovimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tpaquetes`
--

DROP TABLE IF EXISTS `tpaquetes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tpaquetes` (
  `id` int(11) NOT NULL auto_increment,
  `nombre` varchar(200) default NULL,
  `costo_alta` double default NULL,
  `costo_baja` double default NULL,
  `dias` int(11) default NULL,
  `incluye` longtext,
  `itinerario` longtext,
  `estatus` int(11) default NULL,
  `fechaRegistro` datetime default NULL,
  `fechaModificacion` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tpaquetes`
--

LOCK TABLES `tpaquetes` WRITE;
/*!40000 ALTER TABLE `tpaquetes` DISABLE KEYS */;
INSERT INTO `tpaquetes` VALUES (3,'Paquete Chiapas Culturas Vivas',3600,3050,5,'<h6><span style=\"font-size:12px\">* 5 noches de hospedaje en Axkan Arte Hotel 4 estrellas o similar</span></h6>\n\n<h6><span style=\"font-size:12px\">* 4 d&iacute;as de tour</span></h6>\n\n<h6><span style=\"font-size:12px\">*&nbsp; 4 desayunos</span></h6>\n\n<h6><span style=\"font-size:12px\">* entradas a los centros tur&iacute;sticos</span></h6>\n\n<h6><span style=\"font-size:12px\">* seguro de viajero</span></h6>\n\n<h6><span style=\"font-size:12px\">* caf&eacute; org&aacute;nico de Chiapas y posh de cortes&iacute;a</span></h6>\n\n<h6><span style=\"font-size:12px\">* transportaci&oacute;n a todos centros tur&iacute;sticos</span></h6>\n\n<p><span style=\"font-size:12px\">*&nbsp;Servicio de gu&iacute;a en la zona arqueol&oacute;gica de Palenque</span></p>\n','<p><strong>D&iacute;a 1:&nbsp;</strong><strong>Llegada a San Crist&oacute;bal de Las Casas, Chiapas</strong></p>\n\n<p>Le recibimos en las instalaciones de Axkan Arte Hotel o similar a las 15 horas. Tarde libre en San Crist&oacute;bal, pueblo m&aacute;gico donde podr&aacute;s disfrutar de la arquitectura, historia y cultura de esta bella ciudad colonial.</p>\n\n<p><strong>D&iacute;a 2:&nbsp;</strong><strong>Lagos de Montebello y Cascadas &nbsp;del Chifl&oacute;n</strong></p>\n\n<p>A las 8:00 de la ma&ntilde;ana vamos por usted al hotel y nos trasladamos al Chifl&oacute;n, cadena de cascadas y estanques formadas por el Rio San Vicente al caer hacia la depresi&oacute;n central de Chiapas. Nada para deprimirse.</p>\n\n<p>En seguida nos trasladamos a los Lagos de Montebello, mas de sesenta cuerpos de agua entre bosques de pino y encino conforman este parque nacional. Los colores que proyectan sus aguas se debe a un efecto de luz provocado por la refracci&oacute;n del sol y los minerales del fondo.</p>\n',1,'2016-12-18 22:48:31','2017-01-07 11:56:41'),(4,'Paquete Chiapas Culturas',3450,3000,5,'<h6><span style=\"font-size:12px\">* 5 noches de hospedaje en Axkan Arte Hotel 4 estrellas o similar</span></h6>\n\n<h6><span style=\"font-size:12px\">* 4 d&iacute;as de tour</span></h6>\n\n<h6><span style=\"font-size:12px\">*&nbsp; 4 desayunos</span></h6>\n\n<h6><span style=\"font-size:12px\">* entradas a los centros tur&iacute;sticos</span></h6>\n\n<h6><span style=\"font-size:12px\">* seguro de viajero</span></h6>\n\n<h6><span style=\"font-size:12px\">* caf&eacute; org&aacute;nico de Chiapas y posh de cortes&iacute;a</span></h6>\n\n<h6><span style=\"font-size:12px\">* transportaci&oacute;n a todos centros tur&iacute;sticos</span></h6>\n\n<p><span style=\"font-size:12px\">*&nbsp;Servicio de gu&iacute;a en la zona arqueol&oacute;gica de Palenque</span></p>\n','<p><strong>D&iacute;a 1:&nbsp;</strong><strong>Llegada a San Crist&oacute;bal de Las Casas, Chiapas</strong></p>\n\n<p>Le recibimos en las instalaciones de Axkan Arte Hotel o similar a las 15 horas. Tarde libre en San Crist&oacute;bal, pueblo m&aacute;gico donde podr&aacute;s disfrutar de la arquitectura, historia y cultura de esta bella ciudad colonial.</p>\n\n<p><strong>D&iacute;a 2:&nbsp;</strong><strong>Lagos de Montebello y Cascadas &nbsp;del Chifl&oacute;n</strong></p>\n\n<p>A las 8:00 de la ma&ntilde;ana vamos por usted al hotel y nos trasladamos al Chifl&oacute;n, cadena de cascadas y estanques formadas por el Rio San Vicente al caer hacia la depresi&oacute;n central de Chiapas. Nada para deprimirse.</p>\n\n<p>&nbsp;</p>\n',1,'2017-01-06 20:30:19','2017-01-07 11:55:27');
/*!40000 ALTER TABLE `tpaquetes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ttours`
--

DROP TABLE IF EXISTS `ttours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ttours` (
  `id` int(11) NOT NULL auto_increment,
  `nombre` varchar(60) default NULL,
  `precio` double default NULL,
  `incluye` text,
  `destino` text,
  `fechaRegistro` datetime default NULL,
  `fechaModificacion` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ttours`
--

LOCK TABLES `ttours` WRITE;
/*!40000 ALTER TABLE `ttours` DISABLE KEYS */;
INSERT INTO `ttours` VALUES (2,'Cascada El Chiflón y Lagos de Montebello',1000,'<p style=\"margin-bottom: 0px; padding: 0px 0px 1em; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; vertical-align: baseline; color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">* Traslado saliendo desde San Cristóbal</p><p style=\"margin-bottom: 0px; padding: 0px 0px 1em; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; vertical-align: baseline; color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">* Tour a los lagos de Montebello</p><p style=\"margin-bottom: 0px; padding: 0px 0px 1em; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; vertical-align: baseline; color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">* Recorrido por la cascada de “El Chiflón”</p><p style=\"margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; vertical-align: baseline; color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">* Entradas</p>','<p style=\"margin-bottom: 0px; padding: 0px 0px 1em; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; vertical-align: baseline; color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; background: transparent; vertical-align: baseline; color: rgb(233, 8, 128);\"><strong style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; background: transparent; vertical-align: baseline;\">Cascadas El Chiflón</strong></span><br style=\"margin-bottom: 0px;\">Visita a la Cascada El Chiflón, sitio ideal para natación y un buen día de campo.</p><p style=\"margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; vertical-align: baseline; color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; background: transparent; vertical-align: baseline; color: rgb(233, 8, 128);\"><strong style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; background: transparent; vertical-align: baseline;\">Lagos de Montebello</strong></span><br style=\"margin-bottom: 0px;\">Tour por los Lagos de Montebello, admira los tonos multicolores de las principales lagunas mientras convives con la naturaleza.</p>','2016-12-19 13:49:28','2016-12-19 13:49:28');
/*!40000 ALTER TABLE `ttours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tusuarios`
--

DROP TABLE IF EXISTS `tusuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tusuarios` (
  `id` int(11) NOT NULL auto_increment,
  `nombre` varchar(30) default NULL,
  `apellidos` varchar(40) default NULL,
  `telefono` varchar(20) default NULL,
  `email` varchar(30) default NULL,
  `password` varchar(20) default NULL,
  `rol` enum('contador','agente de ventas','administrador') default NULL,
  `comision` double default NULL,
  `temporada` int(11) default NULL,
  `status` int(11) default NULL,
  `fechaRegistro` datetime default NULL,
  `fechaModificacion` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tusuarios`
--

LOCK TABLES `tusuarios` WRITE;
/*!40000 ALTER TABLE `tusuarios` DISABLE KEYS */;
INSERT INTO `tusuarios` VALUES (1,'David','Arcos Cruz','961-17-59630','arcoscruzdavid@gmail.com','david','contador',0,1,1,'2016-12-09 12:13:37','2017-01-07 11:52:12'),(2,'David','Arcos','123456789','kruzpel6@gmail.com','david','administrador',0,1,1,'2016-12-15 09:33:58','2017-01-07 11:52:12'),(3,'Giovana','Mexica','123456789','giovana@gmail.com','david','agente de ventas',5,1,1,'2016-12-15 11:13:12','2017-01-07 11:52:12'),(5,'Viviana','Mexica','123456789','viviana@gmail.com','david','agente de ventas',3,1,1,'2016-12-22 12:22:36','2017-01-07 11:52:12'),(6,'Diana','Mexica','12345678','diana@gmail.com','david','agente de ventas',1.5,1,1,'2016-12-28 15:54:28','2017-01-07 11:52:12'),(7,'Cynthia','Mexica','09877654','cynthia@gmail.com','david','agente de ventas',4,1,1,'2016-12-29 11:27:25','2017-01-07 11:52:12'),(8,'Sofia','Mexica','12344','Sofia@gmail.com','david','agente de ventas',3,1,1,'2017-01-03 13:18:09','2017-01-07 11:52:12'),(9,'Ana','Mexica','34534534','ana@gmail.com','david','agente de ventas',2.6,1,1,'2017-01-03 13:28:50','2017-01-07 11:52:12'),(10,'Karen','Mexica','4534534','karen@gmail.com','david','agente de ventas',2,1,1,'2017-01-03 13:29:22','2017-01-07 11:52:12'),(11,'Ariadna','Mexica','46554645','ariadna@gmail.com','david','agente de ventas',5,1,1,'2017-01-03 13:29:59','2017-01-07 11:52:12'),(12,'Hector','Mexica','5436456','hector@gmail.com','david','agente de ventas',3,1,1,'2017-01-03 13:30:39','2017-01-07 11:52:12');
/*!40000 ALTER TABLE `tusuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tventas`
--

DROP TABLE IF EXISTS `tventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tventas` (
  `id` int(11) NOT NULL auto_increment,
  `idUsuario` int(11) default NULL,
  `cliente` varchar(60) default NULL,
  `correo` varchar(60) default NULL,
  `telefono` varchar(45) default NULL,
  `tipoServicio` varchar(100) default NULL,
  `nombreServicio` varchar(200) default NULL,
  `tipoPago` varchar(45) default NULL,
  `fechaInicial` varchar(60) default NULL,
  `fechaFinal` varchar(60) default NULL,
  `total` double default NULL,
  `anticipo` double default NULL,
  `saldo` double default NULL,
  `referencia` text,
  `comentarios` text,
  `status` varchar(45) default NULL,
  `fechaRegistro` datetime default NULL,
  `fechaModificacion` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tventas`
--

LOCK TABLES `tventas` WRITE;
/*!40000 ALTER TABLE `tventas` DISABLE KEYS */;
INSERT INTO `tventas` VALUES (1,5,'Cesar Arcos','correo@gmail.com','01 800 999999','Tour','Cascada El Chiflón y Lagos de Montebello','efectivo','2016-12-13','2016-12-13',1000,1000,0,'0001072502','ninguno','Pago total','2016-12-26 20:51:10','2016-12-26 20:51:10'),(2,3,'David Arcos Cruz','correo@gmail.com','01 800 999999','Paquete','Paquete Chiapas Ligero','efectivo','2016-12-10','2016-12-15',2800,2800,0,'4001072502 ','ninguno','Pago total','2016-12-27 11:35:18','2016-12-27 11:35:18'),(3,3,'Ovalles','correo@gmail.com','01 800 999999','Tour','Cascada El Chiflón y Lagos de Montebello','efectivo','2016-12-15','2016-12-15',1000,500,500,'0001072502','ninguno','Pago parcial','2016-12-27 15:10:49','2016-12-27 15:10:49'),(4,5,'Valeria Pimentel','correo@gmail.com','01 800 999999','Paquete','Paquete Chiapas Ligero','deposito','2016-12-03','2016-12-06',2800,1500,1300,'010101010','ninguno','Pago parcial','2016-12-28 10:31:28','2016-12-28 10:31:28'),(5,6,'Alex','correo@gmail.com','01 800 999999','Paquete','Paquete Chiapas Ligero','efectivo','2016-12-05','2016-12-08',2800,1350,1450,'4001072502 ','ninguna','Pago parcial','2016-12-28 19:54:03','2016-12-28 19:54:03'),(6,7,'David Arcos Cruz','correo@gmail.com','01 800 999999','Paquete','Paquete Chiapas Ligero','efectivo','2016-12-13','2016-12-20',2800,1000,1800,'4001072502 ','ninguno','Pago parcial','2017-02-13 14:29:07','2017-02-13 14:29:07'),(7,5,'Alex','correo@gmail.com','01 800 999999','Tour','Cascada El Chiflón y Lagos de Montebello','efectivo','2016-12-25','2016-12-25',1000,1000,0,'0001072502 ','ninguno','Pago total','2016-12-30 14:57:52','2016-12-30 14:57:52'),(12,3,'David Arcos Cruz','arcos@gmail.com','756757','Paquete','Paquete Chiapas Ligero','efectivo','2017-01-15','2017-01-19',2800,1000,1800,'4001072502 ','nada','Pago parcial','2017-01-01 20:27:41','2017-01-01 20:27:41'),(13,3,'Ovalles','arcos@gmail.com','435454','Paquete','Paquete Chiapas Ligero','transferencia','2017-01-03','2017-01-06',2800,345,2455,'0001072502 ','ninguno','Pago parcial','2017-01-03 11:55:16','2017-01-03 11:55:16'),(14,3,'Alex','arcoscruzdavid@gmail.com','99999999','Tour','Cascada El Chiflón y Lagos de Montebello','efectivo','2017-01-03','2017-01-03',1000,567,433,'-----','ninguno','Pago parcial','2017-01-03 11:56:31','2017-01-03 11:56:31'),(15,3,'Margarita','queen.dany1974@gmail.com','8709870','Paquete','Paquete Chiapas Ligero','efectivo','2017-01-17','2017-01-20',2800,0,2800,'-----','nada\n','Pago parcial','2017-01-03 12:00:19','2017-01-03 12:00:19');
/*!40000 ALTER TABLE `tventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'contable'
--
/*!50003 DROP PROCEDURE IF EXISTS `actualizarPaquete` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarPaquete`(IN nombre VARCHAR(200),
IN costo_alta DOUBLE,IN costo_baja DOUBLE,IN incluye TEXT,
IN dias INT,IN itinerario TEXT,IN idP INT)
BEGIN
	UPDATE `contable`.`tpaquetes`
SET
`nombre` = nombre,
`costo_alta` = costo_alta,
`costo_baja` = costo_baja,
`dias` = dias,
`incluye` = incluye,
`itinerario` = itinerario,
`fechaModificacion` = now()
WHERE `id` = idP;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizarTour` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarTour`(IN id INT,IN nombre VARCHAR(80),
IN sale VARCHAR(80),IN descp TEXT,IN salida VARCHAR(60),
IN regreso VARCHAR(60),IN hrs VARCHAR(60),
IN precioalta DOUBLE,IN preciobaja DOUBLE)
BEGIN
	UPDATE `contable`.`cat_tours_new`
SET
`tour` = nombre,
`saliendo` = sale,
`descripcion` = descp,
`horario_salida` = salida,
`horario_regreso` = regreso,
`duracion` = hrs,
`costo_alta` = precioalta,
`costo_baja` = preciobaja
WHERE `id_tour` = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `borra_pack` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `borra_pack`(IN pack INT,IN st INT)
BEGIN
	UPDATE `contable`.`tpaquetes`
	SET
	`estatus` = st
	WHERE `id` = pack;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `borra_tour` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `borra_tour`(IN tour INT,
IN st INT)
BEGIN
	UPDATE `contable`.`cat_tours_new`
	SET
	`estatus` = st
	WHERE `id_tour` = tour;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cambioTemporada` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cambioTemporada`(IN temp INT)
BEGIN
	UPDATE `contable`.`tusuarios`
SET
`temporada` = temp,
`fechaModificacion` = now()
WHERE temporada!=temp and id!=0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cant_cotizacion` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cant_cotizacion`(IN idA INT,IN fecha VARCHAR(50))
BEGIN
	SELECT count(*) as cont FROM contable.tcotizaciones 
    where idAgente=idA and fechaRegistro like CONCAT('%',fecha,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cant_ventas` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cant_ventas`(IN idU INT,IN fecha VARCHAR(50))
BEGIN
	SELECT count(*) as cont FROM contable.tventas 
    where idUsuario=idU and fechaRegistro like CONCAT('%',fecha,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `detalles_cotizacion` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `detalles_cotizacion`(IN cotizacion INT)
BEGIN
	SELECT * FROM contable.tcotizaciones WHERE id=cotizacion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `detalles_mov` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `detalles_mov`(IN id INT(20))
select m.id,c.banco,c.numeroCuenta,m.fecha,m.descripcion,m.referencia,m.autorizacion,m.concepto,m.deposito,m.retiro,m.saldoMXM,
m.fechaRegistro,m.fechaModificacion,u.nombre,u.apellidos
   from tcuentas as c
   join tmovimientos as m
   on c.id = m.idCuenta
   join tusuarios as u
   on u.id = m.idUsuario
   where m.id = id ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `detalles_pack` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `detalles_pack`(IN pack INT)
BEGIN
	SELECT * FROM contable.tpaquetes WHERE id=pack;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `detalles_tour` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `detalles_tour`(IN tour INT)
BEGIN
	SELECT * FROM contable.cat_tours_new WHERE id_tour=tour;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `detalles_venta` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `detalles_venta`(IN idVenta INT)
BEGIN
	SELECT * FROM contable.tventas WHERE id=idVenta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fechas_venta` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `fechas_venta`(IN id INT)
BEGIN
	SELECT CAST(fechaRegistro AS DATE) fecha
    FROM contable.tventas 
	WHERE idUsuario = id 
    GROUP BY CAST(fechaRegistro AS DATE) 
    ORDER BY CAST(fechaRegistro AS DATE) DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filter_mov` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `filter_mov`(IN fech VARCHAR(30),IN des VARCHAR(30),
IN ret VARCHAR(30),IN dep VARCHAR(30),IN saldo VARCHAR(30),IN idC INT)
BEGIN
	SELECT * FROM contable.tmovimientos where idCuenta=idC and fecha like CONCAT('%',fech,'%') and
descripcion like CONCAT('%',des,'%') and retiro like CONCAT('%',ret,'%') and deposito like CONCAT('%',dep,'%')
and saldoMXM like CONCAT('%',saldo,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filter_mov_gral` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `filter_mov_gral`(IN var VARCHAR(30),IN idC INT)
BEGIN
	SELECT * FROM contable.tmovimientos where idCuenta = idC and (fecha like CONCAT('%',var,'%') or
descripcion like CONCAT('%',var,'%') or retiro like CONCAT('%',var,'%') or deposito like CONCAT('%',var,'%')
or saldoMXM like CONCAT('%',var,'%'));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filter_pack_gral` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `filter_pack_gral`(IN var VARCHAR(60))
BEGIN
	IF (select count(*) from contable.tusuarios where temporada =1 ) >0 THEN
		
        SELECT * FROM contable.tpaquetes where estatus=1 and (nombre like CONCAT('%',var,'%') or
		costo_alta like CONCAT('%',var,'%') or dias like CONCAT('%',var,'%'));

	ELSE
		IF (select count(*) from contable.tusuarios where temporada =2 ) >0 THEN
		
        SELECT * FROM contable.tpaquetes where estatus=1 and (nombre like CONCAT('%',var,'%') or
		costo_baja like CONCAT('%',var,'%') or dias like CONCAT('%',var,'%'));
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filter_pack_gralAdmin` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `filter_pack_gralAdmin`(IN var VARCHAR(60))
BEGIN
	IF (select count(*) from contable.tusuarios where temporada =1 ) >0 THEN
		
        SELECT * FROM contable.tpaquetes where nombre like CONCAT('%',var,'%') or
		costo_alta like CONCAT('%',var,'%') or dias like CONCAT('%',var,'%');

	ELSE
		IF (select count(*) from contable.tusuarios where temporada =2 ) >0 THEN
		
        SELECT * FROM contable.tpaquetes where nombre like CONCAT('%',var,'%') or
		costo_baja like CONCAT('%',var,'%') or dias like CONCAT('%',var,'%');
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filter_tour_gral` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `filter_tour_gral`(IN var VARCHAR(60))
BEGIN
	IF (select count(*) from contable.tusuarios where temporada =1 ) >0 THEN
		
        SELECT * FROM contable.cat_tours_new where estatus=1 and (tour like CONCAT('%',var,'%') or
		costo_alta like CONCAT('%',var,'%'));

	ELSE
		IF (select count(*) from contable.tusuarios where temporada =2 ) >0 THEN
		
        SELECT * FROM contable.cat_tours_new where estatus=1 and (tour like CONCAT('%',var,'%') or
		costo_baja like CONCAT('%',var,'%'));
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filter_tour_gralAdmin` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `filter_tour_gralAdmin`(IN var VARCHAR(60))
BEGIN
	IF (select count(*) from contable.tusuarios where temporada =1 ) >0 THEN
		
        SELECT * FROM contable.cat_tours_new where tour like CONCAT('%',var,'%') or
		costo_alta like CONCAT('%',var,'%');

	ELSE
		IF (select count(*) from contable.tusuarios where temporada =2 ) >0 THEN
		
        SELECT * FROM contable.cat_tours_new where tour like CONCAT('%',var,'%') or
		costo_baja like CONCAT('%',var,'%');
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `login`(IN correo VARCHAR(30),IN pass VARCHAR(30))
BEGIN
	SELECT * FROM contable.tusuarios 
    WHERE email = correo and password = pass and status=1; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_banco` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_banco`(IN nombre VARCHAR(60))
BEGIN
	INSERT INTO `contable`.`tbancos`
	(	`nombre`)
	VALUES
	(nombre);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_comision` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_comision`(IN idA INT,IN idV INT,IN com DOUBLE,
IN pago VARCHAR(60))
BEGIN
IF (SELECT COUNT(*) as cant FROM contable.tmovimientos 
WHERE referencia=(SELECT referencia FROM contable.tventas WHERE id=idV)) > 0 THEN

		INSERT INTO `contable`.`tcomisiones`
	(`idAgente`,
	`idVenta`,
	`venta`,
	`comision`,
	`status`,
	`fechaRegistro`,
	`fechaModificacion`)
	VALUES
	(idA,
	idV,
	(SELECT total FROM contable.tventas WHERE id=idV),
	com*(SELECT total FROM contable.tventas WHERE id=idV)/100,
	'Aprobada',
	now(),
	now());
END IF;
IF pago = 'efectivo' THEN
	INSERT INTO `contable`.`tcomisiones`
	(`idAgente`,
	`idVenta`,
	`venta`,
	`comision`,
	`status`,
	`fechaRegistro`,
	`fechaModificacion`)
	VALUES
	(idA,
	idV,
	(SELECT total FROM contable.tventas WHERE id=idV),
	com*(SELECT total FROM contable.tventas WHERE id=idV)/100,
	'Aprobada',
	now(),
	now());
ELSE
	IF (SELECT COUNT(*) as cant FROM contable.tmovimientos 
	WHERE referencia=(SELECT referencia FROM contable.tventas WHERE id=idV)) = 0 THEN

			INSERT INTO `contable`.`tcomisiones`
		(`idAgente`,
		`idVenta`,
		`venta`,
		`comision`,
		`status`,
		`fechaRegistro`,
		`fechaModificacion`)
		VALUES
		(idA,
		idV,
		(SELECT total FROM contable.tventas WHERE id=idV),
		com*(SELECT total FROM contable.tventas WHERE id=idV)/100,
		'No aprobada',
		now(),
		now());
	END IF;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_cotizacion` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_cotizacion`(IN idAgente INT,IN cliente VARCHAR(80),
IN clienteCorreo VARCHAR(80),IN direccion VARCHAR(200),
IN mensaje TEXT,IN url TEXT)
BEGIN
		INSERT INTO `contable`.`tcotizaciones`
	(`idAgente`,
	`cliente`,
	`clienteCorreo`,
	`direccion`,
	`mensaje`,
    `urlPdf`,
	`fechaRegistro`,
	`fechaModificacion`)
	VALUES
	(idAgente,
	cliente,
	clienteCorreo,
	direccion,
	mensaje,
    url,
	now(),
	now());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_cuenta` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_cuenta`(IN alias VARCHAR(45),IN banco VARCHAR(45),IN numeroCuenta VARCHAR(45),
IN saldoTotal DOUBLE,IN fechaRegistro DATETIME,IN fechaModificacion DATETIME)
BEGIN
	INSERT INTO `contable`.`tcuentas`
(`referencia`,
`banco`,
`numeroCuenta`,
`saldoTotal`,
`fechaRegistro`,
`fechaModificacion`)
VALUES
(alias,
banco,
numeroCuenta,
saldoTotal,
fechaRegistro,
fechaModificacion);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_movimiento` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_movimiento`(IN idCuenta INT(20),IN idUsuario INT(20),
IN fecha VARCHAR(40),IN descripcion VARCHAR(60),IN referencia VARCHAR(20),
IN autorizacion VARCHAR(20),IN concepto VARCHAR(60),IN deposito DOUBLE,
IN retiro DOUBLE,IN fechaRegistro DATETIME,IN fechaModificacion DATETIME)
BEGIN
	INSERT INTO `contable`.`tmovimientos`
(`idCuenta`,
`idUsuario`,
`fecha`,
`descripcion`,
`referencia`,
`autorizacion`,
`concepto`,
`deposito`,
`retiro`,
`saldoMXM`,
`fechaRegistro`,
`fechaModificacion`)
VALUES
	(idCuenta,
	idUsuario,
	fecha,
	descripcion,
	referencia,
	autorizacion,
	concepto,
	deposito,
	retiro,
	(SELECT saldoTotal FROM `contable`.`tcuentas` WHERE `id`=idCuenta)+deposito-retiro,
	fechaRegistro,
	fechaModificacion);
    UPDATE `contable`.`tcuentas`
SET
`saldoTotal` = (SELECT c.saldoTotal FROM (SELECT * FROM `contable`.`tcuentas` WHERE `id`=idCuenta) AS c)+deposito-retiro,
`fechaModificacion` = fechaModificacion
WHERE `id` = idCuenta;


UPDATE contable.tcomisiones c
INNER JOIN contable.tventas v ON (c.idVenta = v.id)
INNER JOIN contable.tmovimientos m ON (m.referencia = v.referencia)
SET c.status = 'Aprobada'
WHERE m.id = (SELECT MAX(id) as id FROM contable.tmovimientos WHERE contable.tmovimientos.idUsuario=idUsuario);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_paquete` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_paquete`(IN nombre VARCHAR(60),
IN precioalta DOUBLE,IN preciobaja DOUBLE,
IN dias INT,IN incluye LONGTEXT,IN itinerario LONGTEXT,IN fechaRegistro DATETIME,
IN fechaModificacion DATETIME)
BEGIN
	INSERT INTO `contable`.`tpaquetes`
	(`nombre`,
	`costo_alta`,
    `costo_baja`,
	`dias`,
	`incluye`,
	`itinerario`,
    `estatus`,
    `fechaRegistro`,
    `fechaModificacion`)
	VALUES
	(nombre,
	precioalta,
    preciobaja,
	dias,
	incluye,
	itinerario,
    1,
    fechaRegistro,
    fechaModificacion);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_tour` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_tour`(IN tour VARCHAR(60),
IN salida VARCHAR(60),IN descripcion TEXT,
IN horasalida VARCHAR(60),IN horaregreso VARCHAR(60),
IN duracion VARCHAR(60),
IN costoalta DOUBLE,IN costobaja DOUBLE, 
IN fechaRegistro DATETIME,
IN fechaModificacion DATETIME)
BEGIN
	INSERT INTO `contable`.`cat_tours_new`
	(`tour`,
	`saliendo`,
	`descripcion`,
	`horario_salida`,
    `horario_regreso`,
    `duracion`,
    `costo_alta`,
    `costo_baja`,
    `estatus`)
	VALUES
	(tour,
	salida,
	descripcion,
	horasalida,
    horaregreso,
    duracion,
    costoalta,
    costobaja,
    1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_usuario` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_usuario`(IN nombre VARCHAR(30),IN apellidos VARCHAR(40),
IN telefono VARCHAR(20),IN email VARCHAR(30),IN pass VARCHAR(20),
IN rol VARCHAR(30),IN comision DOUBLE,IN fechaRegistro DATETIME,IN fechaModificacion DATETIME,
IN temporada INT)
BEGIN
	INSERT INTO `contable`.`tusuarios`
(`nombre`,
`apellidos`,
`telefono`,
`email`,
`password`,
`rol`,
`comision`,
`temporada`,
`status`,
`fechaRegistro`,
`fechaModificacion`)
VALUES
(nombre,
apellidos,
telefono,
email,
pass,
rol,
comision,
temporada,
1,
fechaRegistro,
fechaModificacion);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_venta` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_venta`(IN idUsuario INT,IN cliente VARCHAR(60),IN tipoServicio VARCHAR(100),
IN nombreServicio VARCHAR(200),IN tipoPago VARCHAR(45),
IN total DOUBLE,IN anticipo DOUBLE, IN saldo DOUBLE,
IN referencia TEXT, IN comentarios TEXT,IN estado VARCHAR(45),
IN fechaRegistro DATETIME,IN fechaModificacion DATETIME,
IN correo VARCHAR(60),IN telefono VARCHAR(60),IN inicio VARCHAR(60),
IN final VARCHAR(60))
BEGIN
	INSERT INTO `contable`.`tventas`
	(`idUsuario`,
    `cliente`,
    `correo`,
    `telefono`,
	`tipoServicio`,
	`nombreServicio`,
	`tipoPago`,
    `fechaInicial`,
    `fechaFinal`,
	`total`,
	`anticipo`,
	`saldo`,
	`referencia`,
	`comentarios`,
    `status`,
    `fechaRegistro`,
    `fechaModificacion`)
	VALUES
	(idUsuario,
    cliente,
    correo,
    telefono,
	tipoServicio,
	nombreServicio,
	tipoPago,
    inicio,
    final,
	total,
	anticipo,
	saldo,
	referencia,
	comentarios,
    estado,
    fechaRegistro,
    fechaModificacion);
    SELECT MAX(id) as id FROM contable.tventas WHERE contable.tventas.idUsuario=idUsuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte_cotizacionAgente` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reporte_cotizacionAgente`(IN id INT,IN inicio VARCHAR(60),
IN final VARCHAR(60))
BEGIN
	SELECT COUNT(*) cotizaciones,fechaRegistro FROM contable.tcotizaciones
WHERE idAgente=id AND fechaRegistro BETWEEN inicio  AND final
GROUP BY DATE(fechaRegistro);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte_ventaAgente` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reporte_ventaAgente`(IN id INT,IN inicio VARCHAR(60),
IN final VARCHAR(60))
BEGIN
	SELECT v.fecha,v.total,v.anticipo,v.saldo,s.total totalventa,s.anticipo totalpagado,s.saldo diferencia
FROM (SELECT DATE(v.fechaRegistro) fecha,v.total,v.anticipo,v.saldo 
FROM contable.tventas v
WHERE v.idUsuario=id AND v.fechaRegistro BETWEEN inicio  AND final) v
INNER JOIN (SELECT DATE(fechaRegistro) fecha, COALESCE(SUM(total),0) AS total,
COALESCE(SUM(anticipo),0) AS anticipo,
COALESCE(SUM(saldo),0) AS saldo
FROM contable.tventas
    WHERE idUsuario=id and fechaRegistro BETWEEN inicio  AND final
    GROUP BY DATE(fechaRegistro)) s  ON s.fecha=v.fecha;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte_VentaGralAgente` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reporte_VentaGralAgente`(IN id INT,IN inicio VARCHAR(60),
IN final VARCHAR(60))
BEGIN
	SELECT COALESCE(SUM(v.total),0) total,
    COALESCE(SUM(v.anticipo),0) totalpagado,
    COALESCE(SUM(v.saldo),0) diferencia
	FROM contable.tventas v 
	WHERE v.idUsuario=id and  v.fechaRegistro 
    BETWEEN inicio  AND final;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte_ventaMes` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reporte_ventaMes`(IN fecha VARCHAR(60))
BEGIN
	SELECT u.id id,u.nombre agente,COALESCE(SUM(v.total),0) total,
	COALESCE(SUM(v.anticipo),0) totalpagado,COALESCE(SUM(v.saldo),0) diferencia
	FROM contable.tventas v 
	inner join contable.tusuarios u on v.idUsuario=u.id
	WHERE u.rol = 'agente de ventas'  
    AND v.fechaRegistro like CONCAT('%',fecha,'%') 
	GROUP BY u.nombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte_VentaMesGral` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reporte_VentaMesGral`(IN fecha VARCHAR(60))
BEGIN
	SELECT COALESCE(SUM(v.total),0) total,
    COALESCE(SUM(v.anticipo),0) totalpagado,
    COALESCE(SUM(v.saldo),0) diferencia
	FROM contable.tventas v 
	WHERE v.fechaRegistro like CONCAT('%',fecha,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte_ventaMesNo` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reporte_ventaMesNo`(IN fecha VARCHAR(60))
BEGIN
	SELECT nombre FROM contable.tusuarios u WHERE u.id 
NOT IN (SELECT DISTINCT u.id id
	FROM contable.tventas v 
	inner join contable.tusuarios u on v.idUsuario=u.id
	WHERE u.rol = 'agente de ventas' AND v.fechaRegistro like CONCAT('%',fecha,'%') 
	GROUP BY u.nombre) and u.rol = 'agente de ventas';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte_ventasRango` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reporte_ventasRango`(IN fechaI VARCHAR(60),IN fechaF VARCHAR(60))
BEGIN
	SELECT u.id id,u.nombre agente,COALESCE(SUM(v.total),0) total,
	COALESCE(SUM(v.anticipo),0) totalpagado,COALESCE(SUM(v.saldo),0) diferencia
	FROM contable.tventas v 
	inner join contable.tusuarios u on v.idUsuario=u.id
	WHERE u.rol = 'agente de ventas' AND v.fechaRegistro BETWEEN fechaI  AND fechaF 
	GROUP BY u.nombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte_ventasRangoGral` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reporte_ventasRangoGral`(IN fechaI VARCHAR(60),IN fechaF VARCHAR(60))
BEGIN
	SELECT COALESCE(SUM(v.total),0) total,
    COALESCE(SUM(v.anticipo),0) totalpagado,
    COALESCE(SUM(v.saldo),0) diferencia
	FROM contable.tventas v 
	WHERE v.fechaRegistro BETWEEN fechaI  AND fechaF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte_ventasRangoNo` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reporte_ventasRangoNo`(IN fechaI VARCHAR(60),IN fechaF VARCHAR(60))
BEGIN
	SELECT nombre FROM contable.tusuarios u WHERE u.id 
NOT IN (SELECT DISTINCT u.id id
	FROM contable.tventas v 
	inner join contable.tusuarios u on v.idUsuario=u.id
	WHERE u.rol = 'agente de ventas' AND v.fechaRegistro BETWEEN fechaI  AND fechaF
	GROUP BY u.nombre) and u.rol = 'agente de ventas';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `status_Modificacion` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `status_Modificacion`(IN idU INT, IN st INT)
BEGIN
	UPDATE `contable`.`tusuarios`
	SET
	`status` = st
	WHERE `id` = idU;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `total_ventas` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `total_ventas`(IN idU INT,IN fecha VARCHAR(60))
BEGIN
	SELECT COALESCE(SUM(total),0) AS total FROM contable.tventas
    WHERE idUsuario=idU and fechaRegistro like CONCAT('%',fecha,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `verifica_banco` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `verifica_banco`(IN banco VARCHAR(30))
BEGIN
	SELECT *
	FROM `contable`.`tbancos` WHERE nombre=banco;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ver_agentes` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ver_agentes`()
BEGIN
	SELECT * FROM contable.tusuarios WHERE rol='agente de ventas' 
    and status=1 order by id desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ver_bancos` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ver_bancos`()
BEGIN
	SELECT * FROM contable.tbancos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ver_comisiones` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ver_comisiones`(IN idA INT,IN fecha VARCHAR(60))
BEGIN
	SELECT v.cliente cliente,v.nombreServicio venta,c.venta total,c.comision comision,
c.status status
FROM contable.tcomisiones c
INNER JOIN contable.tventas v on c.idAgente=v.idUsuario
WHERE c.idVenta=v.id and c.idAgente=idA  and v.fechaRegistro like CONCAT('%',fecha,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ver_cotizaciones` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ver_cotizaciones`(IN idA INT,IN fecha VARCHAR(60))
BEGIN
	SELECT * FROM contable.tcotizaciones WHERE idAgente=idA AND fechaRegistro like CONCAT('%',fecha,'%') ORDER BY id DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ver_cuenta` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ver_cuenta`()
BEGIN
	SELECT * FROM contable.tcuentas order by id desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ver_movimiento` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ver_movimiento`(IN idC INT)
BEGIN
	select * 
    from tmovimientos where idCuenta = idC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ver_movimientoFecha` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ver_movimientoFecha`(IN idC INT,IN idU INT,IN fecha VARCHAR(60))
BEGIN
	select * 
    from tmovimientos where idCuenta = idC and
    fechaRegistro like CONCAT('%',fecha,'%') order by id desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ver_paquetes` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ver_paquetes`()
BEGIN
	SELECT * FROM contable.tpaquetes;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ver_tours` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ver_tours`()
BEGIN
	SELECT * FROM contable.cat_tours_new;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ver_usuarios` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ver_usuarios`()
BEGIN
	SELECT * FROM contable.tusuarios
    where rol != 'administrador'
    order by id desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ver_ventas` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ver_ventas`(IN idA INT,IN fecha VARCHAR(50))
BEGIN
	SELECT * FROM contable.tventas WHERE idUsuario=idA AND fechaRegistro like CONCAT('%',fecha,'%') ORDER BY id DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ver_VentasConteo` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ver_VentasConteo`(IN id INT,IN inicio VARCHAR(60),
IN final VARCHAR(60))
BEGIN
	SELECT count(*) cont, fechaRegistro fecha FROM contable.tventas 
    where idUsuario=id
AND fechaRegistro BETWEEN inicio  AND final
group by date(fechaRegistro);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-10 11:58:26
