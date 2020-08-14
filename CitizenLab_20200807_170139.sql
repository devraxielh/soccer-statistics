-- Valentina Studio --
-- MySQL dump --
-- ---------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- ---------------------------------------------------------


-- DROP DATABASE "CitizenLab" ------------------------------
DROP DATABASE IF EXISTS `CitizenLab`;
-- ---------------------------------------------------------


-- CREATE DATABASE "CitizenLab" ----------------------------
CREATE DATABASE `CitizenLab` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `CitizenLab`;
-- ---------------------------------------------------------


-- CREATE TABLE "conf" -----------------------------------------
CREATE TABLE `conf`( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`API_key_tw` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`API_secret_key_tw` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`Cantidad_data_tw` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 2;
-- -------------------------------------------------------------


-- CREATE TABLE "cuentas" --------------------------------------
CREATE TABLE `cuentas`( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`cuenta` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`red_social` Int( 255 ) NOT NULL,
	`create` Timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	`update` Timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 703;
-- -------------------------------------------------------------


-- CREATE TABLE "data_twitter" ---------------------------------
CREATE TABLE `data_twitter`( 
	`id` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`screen_name` VarChar( 90 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`name` VarChar( 150 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`location` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`description` Text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "data_twitter_detalle" -------------------------
CREATE TABLE `data_twitter_detalle`( 
	`id` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`usuario` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`text` Text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`place_type` VarChar( 99 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`place` VarChar( 200 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`sentiment` Float( 12, 0 ) NULL,
	`polarity` Float( 12, 0 ) NULL,
	`classification` VarChar( 90 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`p_pos` Float( 12, 0 ) NULL,
	`p_neg` Float( 12, 0 ) NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "redes_sociales" -------------------------------
CREATE TABLE `redes_sociales`( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`nombre` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`create` Timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	`update` Timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 4;
-- -------------------------------------------------------------


-- CREATE TABLE "users_sis" ------------------------------------
CREATE TABLE `users_sis`( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`nombre` VarChar( 90 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`correo` VarChar( 90 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`password` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `correo` UNIQUE( `correo` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 20;
-- -------------------------------------------------------------


-- Dump data of "conf" -------------------------------------
/*!40000 ALTER TABLE `conf` DISABLE KEYS */

BEGIN;

INSERT INTO `conf`(`id`,`API_key_tw`,`API_secret_key_tw`,`Cantidad_data_tw`) VALUES 
( '1', 'F70Tuo2dL0e08mgLU7QTSP9R9', 'I8jKWmBnq2qOlGVnRKintRztIL79q53YDmMUZV5phWpKW9SnBP', '100' );
COMMIT;
/*!40000 ALTER TABLE `conf` ENABLE KEYS */

-- ---------------------------------------------------------


-- Dump data of "cuentas" ----------------------------------
/*!40000 ALTER TABLE `cuentas` DISABLE KEYS */

BEGIN;

INSERT INTO `cuentas`(`id`,`cuenta`,`red_social`,`create`,`update`) VALUES 
( '698', 'Raxielh', '1', '2020-07-28 19:46:48', '2020-07-28 19:48:01' ),
( '699', '42xys', '1', NULL, NULL ),
( '702', 'ElNegrovicto', '1', NULL, NULL );
COMMIT;
/*!40000 ALTER TABLE `cuentas` ENABLE KEYS */

-- ---------------------------------------------------------


-- Dump data of "data_twitter" -----------------------------
/*!40000 ALTER TABLE `data_twitter` DISABLE KEYS */

BEGIN;

INSERT INTO `data_twitter`(`id`,`screen_name`,`name`,`location`,`description`) VALUES 
( '1368220597', 'ElNegrovicto', 'El negro victor', 'Montería, Colombia', 'Periodista cívico independiente de carácter critico, No hago bulto ni soy arrodillado, Director del portal https://t.co/njGvtFceP4' ),
( '15632696', '42xys', 'Juan David', 'Montería', 'Todo lo que escriba aquí puede ser usado en mi contra.' ),
( '92553187', 'Raxielh', 'Rodrigo Garcia Hoyos', 'ÜT: 8.763011,-75.875684', 'Doctorate Student.  His research interest includes Artificial Intelligence, Machine Learning, Web Programming, Autonomic Computing, and Smart Environments.' );
COMMIT;
/*!40000 ALTER TABLE `data_twitter` ENABLE KEYS */

-- ---------------------------------------------------------


-- Dump data of "data_twitter_detalle" ---------------------
/*!40000 ALTER TABLE `data_twitter_detalle` DISABLE KEYS */

BEGIN;

INSERT INTO `data_twitter_detalle`(`id`,`usuario`,`text`,`place_type`,`place`,`sentiment`,`polarity`,`classification`,`p_pos`,`p_neg`) VALUES 
( '1021549823395291136', '92553187', 'RT @Innov_Emp: Dentro del Programa de TRANSFORMACIÓN DIGITAL EMPRESARIAL: 300 EMPRESAS capacitadas. 54 MAKER Capacitados. HOY inicia #HACKA…', '', '', '0', '0', 'pos', '0.740693', '0.259307' ),
( '1022824121225420800', '92553187', 'RT @Innov_Emp: Felicitaciones a los Ganadores #HACKATHONMONTERIA TESEEO, POLO TEAM, LOVE YOUR LIFE, INNOVATEC#2 @felato @Transforma_Dig @Mi…', '', '', '0.6', '0.5', 'pos', '0.555842', '0.444158' ),
( '1073322231009296384', '92553187', '@EriitheD Donde lo conseguiste ?', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1098769301639757825', '92553187', '@ElectricaribeSA no hay fluido eléctrico en el circuito rio sinu 4 desde hace 2 horas #monteria hemos reportado est… ', '', '', '0', '0', 'pos', '0.833333', '0.166667' ),
( '1120942515576877057', '92553187', 'De visita en el Bernabéu ', 'poi', 'Estadio Santiago Bernabéu', '0', '0', 'pos', '0.5', '0.5' ),
( '1122137124436881409', '92553187', '@ErasmoZB @MincomercioCo @MinAgricultura Córdoba tiene que apuntar a la Agricultura de Precision. Ejemplo con siste… ', '', '', '0', '0', 'pos', '0.502717', '0.497283' ),
( '1122184372558417920', '92553187', '@42xys @ErasmoZB @MincomercioCo @MinAgricultura Teóricamente puede servir para cualquier cultivo, ya que la IA va r… ', 'city', 'Madrid', '0', '0', 'pos', '0.5', '0.5' ),
( '1143300360414617600', '92553187', 'RT @Ministerio_TIC: Si estás en un programa tecnológico, esta es tu oportunidad para que @Ministerio_TIC, @Mineducacion e @ICETEX financien…', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1185719180416475136', '92553187', 'Visita de campo tesis de doctorado ganadería de precisión EAFIT EngD ', 'city', 'Montería', '0', '0', 'pos', '0.5', '0.5' ),
( '1186613645037453314', '92553187', 'Metro de Madrid bajo windows XP ', '', '', '0', '0', 'pos', '0.576923', '0.423077' ),
( '1213483679789568000', '92553187', 'Hasta luego Colombia  ', '', '', '0', '0', 'neg', '0.1', '0.9' ),
( '1213673311953141760', '92553187', '', 'country', 'Panamá', '0', '0', 'pos', '0.5', '0.5' ),
( '1213673488038400001', '92553187', '', 'country', 'Panamá', '0', '0', 'pos', '0.5', '0.5' ),
( '1243877956608561155', '15632696', '@Pachoman Un test acá cuesta todo eso? ', '', '', '0', '0', 'neg', '0.222628', '0.777372' ),
( '1243879127037378560', '15632696', '@ClaudiaLopez @DesEconomicoBog @cruzrojabogota A comer arroz Diana después de la crisis. Así es! ', '', '', '0', '0', 'neg', '0.4375', '0.5625' ),
( '1243879591611113472', '15632696', '@MiguelPoloP Lo lamento.', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1243880748580573185', '15632696', '@Tigo_Colombia @BNova53 @pulsodeltiempo2 @Nortevision @GilDelaCruzB @RigoPitalua86 @CarlosPElCholo @VHTamara… ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1243884005365288961', '15632696', '@Fzuletalleras @IvanDuque ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1244090827615469569', '15632696', 'Será que @MovistarCo tendrá el descaro de cobrar este mes. 

Vengo reportando extrema lentitud desde hace varios d… ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1244382921907212289', '15632696', 'Será que necesitamos un caso en cada municipio de Córdoba para que la gente entienda que ES NECESARIO quedarse en c… ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1244387320033411074', '15632696', '@SdrodriguezT @IvanDuque Japón no es Colombia.', '', '', '0', '0', 'neg', '0.25', '0.75' ),
( '1244388352780009472', '15632696', '@SdrodriguezT @IvanDuque Los japoneses tienen algo que no tiene los colombianos y muchas otras naciones: disciplina… ', '', '', '0', '0', 'pos', '0.5375', '0.4625' ),
( '1244442813460353026', '15632696', '@LinkStrifer Q ono rrea parce.', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1244447165075935242', '15632696', '@BNova53 @pulsodeltiempo2 @AngieGarces @SANDYMERLANO @Nortevision @monterialcaldia @marchenojob @CarlosPElCholo… ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1244448069279760384', '15632696', '@caordosgoitia @infopresidencia @LaRazonCo @LaPrensaWeb @Tonsanjr @okysano @NidiaSerrano @lalenguacaribe_… ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1244769377536311297', '15632696', 'Hace más de una semana tengo tos seca sin ningún otro síntoma. Me han recomendado ir a la IPS pero veo inconvenient… ', '', '', '0', '0', 'neg', '0.416667', '0.583333' ),
( '1244769378710798344', '15632696', 'Si no voy, y dejo pasar el tiempo y me complico, pretender recibir atención más adelante, cuando todo esté más comp… ', '', '', '0', '0', 'pos', '0.75', '0.25' ),
( '1245557678119755777', '15632696', '@monterialcaldia Alcalde, ¿en cuánto tiempo estimaron la duración de la pandemia?

¿Cuál es el factor R0 que se det… ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1245801341739565058', '15632696', '@lapopomonteria1 @caordosgoitia Proyección no está bien. Mis reparos en este enlace  ', '', '', '0', '0', 'pos', '0.5625', '0.4375' ),
( '1245802136023244802', '15632696', 'Esta proyección de la alcaldía de Montería tiene varias imprecisiones y cálculos errados.

Aquí explico porqué … ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1245872584467427328', '15632696', 'Gracias a @DiarioPiragua por permitir la participación y el ejercicio de control social de los ciudadanos frente a… ', '', '', '0.0666667', '0.0333333', 'pos', '0.731601', '0.268399' ),
( '1245884206301020160', '15632696', '@monterialcaldia @SaludMonteria Está errada la proyección. Aquí lo expongo ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1245895806256844805', '15632696', '@Luisa_Orozco Estoy tomando un jarabe. La tos no se ha ido del todo. Cada vez que como, hace su aparición.

Espero… ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1246065867407814656', '15632696', 'Hey comité científico de Montería, repite esta frase las veces que sea necesario:

El COVID-19 es una pandemia, no… ', '', '', '0', '0', 'neg', '0.273919', '0.726081' ),
( '1246420102980997121', '15632696', '@SylvanaD28 Siempre listos, nunca inlistos. ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1246561555510104065', '15632696', '@SylvanaD28 @MinSaludCol Ayer estábamos con "cero casos" en Montería, y hoy, de golpe, tenemos un caso y ese caso s… ', '', '', '0', '0', 'neg', '0.377551', '0.622449' ),
( '1247489228356927488', '15632696', '@CristinaVelezV No señora, no es posible.', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1248727913467449345', '15632696', '@Uschimusic Sí. En este lugar tengo todo, no me falta absolutamente nada. De repente mayor velocidad de Internet, pero de resto todo.', '', '', '0', '0', 'neg', '0.211957', '0.788043' ),
( '1249659372126580737', '15632696', '@Luisa_Orozco Hola Luisa. Con emergencias médicas o veterinarias puedes salir cualquier día.', '', '', '0', '0', 'neg', '0.377551', '0.622449' ),
( '1249667495092457472', '15632696', 'RT @jorgeramosnews: Leyendo a Los Danieles los domingos. Bien por el periodismo independiente. 
 @DCoronell y @DanielSamperO saben que s…', '', '', '0', '0', 'pos', '0.5375', '0.4625' ),
( '1249763141682188288', '15632696', 'El pueblo de Cartagena debe rodear al alcalde William Dau.

Luchar contra la clase política tradicional no es fácil… ', '', '', '0', '0', 'neg', '0.446429', '0.553571' ),
( '1249845991777288192', '15632696', '@Nortevision @TransitoMtr ¿Si el usuario no tiene minutos ni datos, qué hace? ¿Se jode?', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1249846674828267520', '15632696', '@Nortevision @TransitoMtr ¿Si tengo el número celular del taxista y lo llamo? ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1249912728837328896', '15632696', '@Pachoman ¿Y qué tiene que ver el caldo con las tajás? ', '', '', '0', '0', 'neg', '0.269375', '0.730625' ),
( '1250404289517928453', '15632696', '@MauricioJaramil ¿Se le subiría "la fama" a la cabeza al señor impuro? ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1250758539779477505', '15632696', '@jtovarr Lo ágil que era para mover el bote.', '', '', '0', '0', 'pos', '0.607955', '0.392045' ),
( '1252384871617462273', '15632696', 'Predicción basada en datos. Excelente @Pachoman. ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1252679463453839363', '15632696', '@AlbertoBernalLe Señor del dólar a 2.800: abrir ahora traería a largo plazo más estragos económicos que abrir cuand… ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1254613587886313472', '15632696', '@SdrodriguezT La alcaldía tiene una herramienta poderosa si eso llega a suceder: sellamientos.

Se dará gusto Claud… ', '', '', '0', '0', 'neg', '0.318182', '0.681818' ),
( '1254736179246911491', '15632696', '@FiscaliaCol @PGN_COL Jajajaja! Y Barbosa tiene el descaro de decir en medios que es un fiscal independiente. … ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1254847051742904320', '15632696', '@ClaudiaLopez 3⃣ cosas:

1. Claudia dio un papayazo y debe asumir consecuencias, así sea temporalmente: perder un… ', '', '', '0', '0', 'neg', '0.444984', '0.555016' ),
( '1255119488191733760', '15632696', '@SdrodriguezT Al menos bajó la cabeza y aceptó. En cambio, ni toda la presión social, mediática y judicial logran q… ', '', '', '0.0666667', '0.0333333', 'neg', '0.431034', '0.568965' ),
( '1256250949015949324', '15632696', 'Tiendas Olimpica @olimpicaSA tiene esto publicado en su página. 10% de descuento en aires Olimpo HOY y MAÑANA. Va u… ', '', '', '0', '0', 'neg', '0.416667', '0.583333' ),
( '1256318463708221447', '15632696', '@olimpicaSA @sicsuper Falso de toda falsedad. Ustedes mismos lo confirmaron. La del chat es mi hermana.

Póngase de… ', '', '', '0', '0', 'neg', '0.34375', '0.65625' ),
( '1256386862425440257', '15632696', '@Luisa_Orozco @olimpicaSA @sicsuper En "el SAO" están aplicando el descuento, ahí lo compramos. El CM de… ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1257073036416647179', '15632696', '¿Por qué no publican las cifras de incremento de contagios y muertes diarias directamente?

Acaso porque saben que… ', '', '', '0', '0', 'neg', '0.378049', '0.621951' ),
( '1257496714107400192', '15632696', '@VickyDavilaH ¡Quién va a ser! Ivancito no tiene esos alcances, su papi sí.', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1257624643541884928', '15632696', '@LinkStrifer @Latrocinium @aramfit ¿Seleccionando memes? ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1257626299465641986', '15632696', '@DanielSamperO El paraquito más querido por los colombianos. ', '', '', '0', '0', 'pos', '0.5375', '0.4625' ),
( '1258932867536732161', '15632696', 'RT @anapamartinez: Hay que seguir intentando ser buenos aunque la gente se empeñe en hacernos ver como los malos.', '', '', '0', '0', 'pos', '0.805847', '0.194153' ),
( '1259523704398254080', '15632696', '@JuanJmnzJotas doc, le dejé un mensaje privado.', '', '', '0', '0', 'pos', '0.55', '0.45' ),
( '1260014255409000448', '15632696', '@pulsodeltiempo2 @esesanjeronimo @LaVentanaDeCord @Nortevision @BNova53 @ElNegrovicto @EricaAnia_ @gerpaezm… ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1260623594696122370', '15632696', 'Bien dicho Aida Victoria. 

A ver si algún día cada uno empieza a interesarse en sus asuntos y dejan que los dem… ', '', '', '0', '0', 'neg', '0.460117', '0.539883' ),
( '1265462503322116096', '15632696', '@Catalizate @PoliciaBogota No es inteligente discutir ni alegar con la Policía en la calle, ellos siempre van a que… ', '', '', '0', '0', 'neg', '0.381995', '0.618005' ),
( '1265604147052777473', '15632696', 'RT @Pachoman: Mayo 27 a las 7:00pm (COL) en #Pachoenvivo estaré con @42xys hablando sobre el caso Arias: Lo bueno, lo malo y lo incierto.
A…', '', '', '0', '0', 'neg', '0.0324304', '0.96757' ),
( '1265968927907164162', '15632696', '@LinkStrifer @UnisinuOficial Link, tenemos captura de los otros tweets borrados?', '', '', '0', '0', 'pos', '0.574125', '0.425875' ),
( '1266574674835714053', '15632696', '@RosemberL ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1267098466758656000', '15632696', '@JesusEraso51 Admirable, Jesús. Eres ejemplo e inspiración para muchas personas. ', '', '', '0', '0', 'neg', '0.496575', '0.503425' ),
( '1267977813757497348', '15632696', '@RosemberL Cómo así, Ros?', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1268743254289285122', '15632696', '¡Ya nadan libres! Dolor de cabeza para sus padres: se escapan y alrededor del 50% han sido devorados.

Recibo aport… ', '', '', '0', '0', 'pos', '0.833333', '0.166667' ),
( '1269266742246809601', '15632696', '¡Qué desgracia de Fiscal el que tenemos! 

En Perú ya lo hubieran hecho renunciar. Acá nos quejamos y nos quej… ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1269267173387767808', '15632696', '@_Dianaper_ Ta bonita. Disfrútala.', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1269269124406022144', '15632696', '@soyyleonardo14 Tienes que sentirse orgulloso: la labor de los domiciliarios es valiosa. Con la pandemia estoy soli… ', '', '', '0', '0', 'pos', '0.550427', '0.449573' ),
( '1270114453489684480', '15632696', 'Usuarios de @MovistarCo que están suspendidos no tienen derecho a interponer PQR por líneas de atención. El sistema… ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1272522729657434113', '15632696', 'No caigan en la trampa de comprar los días sin IVA. Terminarán pagando más por menos. Recuerden que vivimos en un p… ', '', '', '0', '0', 'pos', '0.599071', '0.400929' ),
( '1273714823327555589', '15632696', '@BNova53 @JhaderCano Boris en la gestión de redes de los políticos se encuentra de cuánta porquería y prácticas des… ', '', '', '0', '0', 'pos', '0.599071', '0.400929' ),
( '1273715617175089152', '15632696', '@anteojosdeoso @colombia_hist @genteconvos @antioquiantrip @yoapoyoalcampo @PaisajeCol @elpenolant @MuseosColombia… ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1273846900895158273', '15632696', 'Nuevo precio del TV 32D2200 (ya sin IVA) no coincide con el anunciado en el catalogo promocional. 
@olimpicaSA ¡Fav… ', '', '', '0', '0', 'pos', '0.700561', '0.299439' ),
( '1273968572683952128', '15632696', '@RosemberL Solo a Duque se le ocurre meter tres días sin IVA en pleno ascenso de la curva de contagios en medio de una pandemia.', '', '', '0', '0', 'neg', '0.439655', '0.560345' ),
( '1273972405296300038', '15632696', '#DiaSinIVA reactivará economía y contagios.

Suerte a todos en la reactivación. ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1273972880343269377', '15632696', 'La gente se descontroló. Salieron en masa a comprar como si no hubiera un mañana. ¿Y si todo hace parte de un macab… ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1274013134668419072', '15632696', 'Ya pude comprar los televisores. Gracias @olimpicaSA por corregir los precios. ', '', '', '0', '0', 'pos', '0.5375', '0.4625' ),
( '1274013364960866305', '15632696', '@Pachoman @IvanDuque Para reactivar los contagios, sí. ', '', '', '0', '0', 'pos', '0.5375', '0.4625' ),
( '1274041424833581062', '15632696', '@BNova53 @AngieGarces @caordosgoitia @CarlosPElCholo @javierdelahoz20 @marchenojob @Nortevision @pulsodeltiempo2… ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1274042963216171014', '15632696', 'Sigue sin caberme en la cabeza esta lógica de @IvanDuque y su #DiaSinIVA: mandar a la gente a guardarse y pedirles… ', '', '', '0', '0', 'pos', '0.5625', '0.4375' ),
( '1274044241673666564', '15632696', 'Tres #DiaSinIVA espaciados dos semanas uno del otro en pleno ascenso de la curva de contagios, parece un macabro pl… ', '', '', '0', '0', 'neg', '0.25', '0.75' ),
( '1274044738358960128', '15632696', '@Y1ba @BNova53 @AngieGarces @caordosgoitia @CarlosPElCholo @javierdelahoz20 @marchenojob @Nortevision… ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1274425422428733445', '15632696', '@MovistarCo Sí, todavía necesito de su atención. ¿Vamos al DM?', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1276695503611314176', '15632696', 'La vida está llena de constantes y pequeñas injusticias, donde algunas veces el esfuerzo y la valentía no son compe… ', '', '', '0', '0', 'neg', '0.312212', '0.687788' ),
( '1279904333937729538', '15632696', '@LinkStrifer Pos fíjate que me fijé fue en los headphones.', '', '', '0', '0', 'neg', '0.410828', '0.589172' ),
( '1280208678109483009', '15632696', 'En ocasiones, la diferencia entre vivir o morir, está determinada por el uso del sentido común. La desgracia de Tas… ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1280209707970506752', '15632696', 'Una cosa es que "la necesidad" los lleve a saquear un camión volcado cargado de arroz, plátano o cereales, y otra m… ', '', '', '0', '0', 'pos', '0.5375', '0.4625' ),
( '1280211117650980866', '15632696', 'Hay una desgracia mayor que la misma desgracia en sí de Tasajera, y es la indolencia de las personas que se han val… ', '', '', '0', '0', 'pos', '0.684629', '0.315371' ),
( '1280658944873181184', '15632696', '@MariaFdaCabal Y hay gente que le aplaude estas cosas a la Cabal. ', '', '', '0', '0', 'pos', '0.833333', '0.166667' ),
( '1282091099792855041', '15632696', '@RosemberL @SebasMestraV @asbsdn ¿Ese "si" qué, viejo Ros?

En todo caso, no. No valió la puta pena. El esmigajonam… ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1283101509564149760', '15632696', '@segiraldo91 @MunirFalah Pos eso es mejor que echarlos. Bien pudo despedirlos a todos por suspensión de la activida… ', '', '', '0', '0', 'neg', '0.25', '0.75' ),
( '1283110660033974273', '15632696', '@OziMaNtiZcOc @segiraldo91 @MunirFalah Pues eso sería un supuesto inargumentable, igual que decir: "y si les está p… ', '', '', '0', '0', 'pos', '0.678571', '0.321429' ),
( '1283111530431750145', '15632696', '@MajoLedes ¿De 0 a @majoledes en qué nivel estás @LinkStrifer?', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1283175990169088001', '15632696', '@PaulitoAF @soyvalelu @sujsdjsksosjd @lorcasara1 @Paauladelacruz Por eso siempre he dicho que ir al sicólogo, podrí… ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1283736744379256834', '15632696', '@jmontoyaco @GabrielPuello17 @ElNegrovicto Estoy de acuerdo con el periodista Montoya. Una misión del periodista es… ', '', '', '0', '0', 'neg', '0.302288', '0.697712' ),
( '1284174117688745984', '1368220597', '#PaTenerEnCuenta
Muy bien @Mutualsereps por el TESTEO que REALIZAN en la zona NORTE de Montería, esa es la razón de… ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1284182468854263811', '1368220597', '#TalCual
Me disculpan pero los MUERTOS de TASAJERA no son ningunos MÁRTIRES, son VÍCTIMAS de su propio ACTO DELINCU… ', '', '', '0', '0', 'pos', '0.6128', '0.3872' ),
( '1284192688896716800', '1368220597', 'Lo que es el sustento de algunos en plena pandemia, es incomodidad para otros. ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1284194884333850624', '1368220597', 'Sigue muriendo gente en el Hospital de Montelibano por negligencia del alcalde @JoseDavidCura1 , como es posible qu… ', '', '', '0', '0', 'pos', '0.550847', '0.449153' ),
( '1284200387231309825', '1368220597', 'Ajá y el oxígeno para cuando? Cuando se dignará CRYOGAS S.A a suministrar el oxígeno.... OJO, contrato hay, lo que… ', '', '', '0', '0', 'pos', '0.833333', '0.166667' ),
( '1284234332979310593', '1368220597', 'RT @ErasmoZB: Este sábado 18 de julio, quiero invitarlos a un #FacebookLive para que conozcan el trabajo que realicé en mi segunda legislat…', '', '', '0', '0', 'neg', '0.166667', '0.833333' ),
( '1284254677543026696', '1368220597', '#QueTal?
TURISTAS DISFRAZADOS de MIEMBROS de cadena primaria básica de abastecimiento, IRRUMPEN de forma arbitraria… ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1284481887831052288', '1368220597', 'RT @oscarpetroR: @ElNegrovicto Así es negro victor, “ El que habita el abrigo del altisimo, morará en la sombra del omnipotente “. No hay r…', '', '', '0', '0', 'pos', '0.860656', '0.139344' ),
( '1284818389802901504', '1368220597', 'RT @ErasmoZB: La señora Raquel del Carmen Vellojín de De la Vega, se encuentra internada en la Clínica del Río con síntomas de Covid-19. Se…', '', '', '0', '0', 'pos', '0.887454', '0.112546' ),
( '1284818409843294212', '1368220597', 'RT @ErasmoZB: Por solicitud de familiares de la paciente, hago un respetuoso llamado a las autoridades para atender la solicitud de UCI. Pa…', '', '', '0', '0', 'neg', '0.378049', '0.621951' ),
( '1285373719091851276', '1368220597', 'RT @lalenguacaribe_: #EsNoticia | El senador David Barguil pide al Gobierno Nacional atención inmediata para Montería, ocupación UCI llegó…', '', '', '0', '0', 'pos', '0.583019', '0.416981' ),
( '1285619576869474305', '1368220597', '#OjoAlDato
Si algo ha demostrado @orlandobenitezm es ser un hombre CORRECTO, que conoce y quiere a su DPTO, atrás q… ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1285627508130566145', '1368220597', 'RT @lalenguacaribe_: El director de La Lengua Caribe, Víctor Arrieta Méndez, el equipo periodístico y personal administrativo del diario di…', '', '', '0.3', '0', 'pos', '0.634254', '0.365746' ),
( '1285636324670820355', '1368220597', '#Chimá
Tribunal Administrativo de Córdoba negó demanda de nulidad de la elección del alcalde de Chima ', '', '', '0', '0', 'neg', '0.166667', '0.833333' ),
( '1285743091425710080', '1368220597', '#UnAltoEnElCamino
En los momentos de CRISIS, es donde los EGOS y DIFERENCIAS deben ZANJARSE, @caordosgoitia viene h… ', '', '', '0', '0', 'pos', '0.678364', '0.321636' ),
( '1285922051946164224', '1368220597', 'Que el @MincomercioCo Jose Manuel Restrepo y el presidente de @Bancoldex Javier Diaz Fajardo hayan participado en e… ', '', '', '0', '0', 'pos', '0.875', '0.125' ),
( '1285925877767909377', '1368220597', 'Quieres saber sobre la restauración económica y apoyo de la @GobCordoba_ a campesinos del sector agrícola y pecuari… ', '', '', '0', '0', 'pos', '0.735294', '0.264706' ),
( '1286010500783001602', '1368220597', '#ATENCION ... URGENTE 
El corregimiento de Santa Lucía Montería está siendo foco de contagio de #Covid-19, me infor… ', '', '', '0', '0', 'pos', '0.590909', '0.409091' ),
( '1286121640905052166', '1368220597', '#Bandidos
Estos MONTAJES chimbos e IMFANES, son la vil MUESTRA de las PORQUERÍAS y PATRAÑAS de la que están hecho,… ', '', '', '0', '0', 'neg', '0.216253', '0.783747' ),
( '1286411368254472194', '1368220597', 'En la @clinicactf hay un grupo de HÉROES, después de los médicos, que también hacen un gran TRABAJO para salvar vid… ', '', '', '0', '0', 'pos', '0.853175', '0.146825' ),
( '1286468806563569664', '1368220597', '¡El colmo! Servigenerales cambió a Urbaser sin licencia ambiental ni el visto bueno de la Alcaldía de Montería… ', '', '', '0', '0', 'pos', '0.5625', '0.4375' ),
( '1286641129144889345', '15632696', 'Jajaja, claramente Manhattan no se pronuncia #manjaran, ni one dolar "uan dolar".

El neoyorkino de calle -que es l… ', '', '', '0', '0', 'pos', '0.664633', '0.335367' ),
( '1286686132059746306', '1368220597', 'RT @caordosgoitia: Desde el inicio de los cierres inteligentes hemos realizado 1846 tomas de muestras PCR (hisopado) con EPS y cerca de 300…', '', '', '0', '0', 'neg', '0.413462', '0.586538' ),
( '1286708396478074883', '15632696', '¡Qué decepción @Homecenter_co! Llamo a la línea de venta telefónica, y le comento al asesor que hay una información… ', '', '', '0', '0', 'pos', '0.833333', '0.166667' ),
( '1286709525836443648', '15632696', 'Este producto de Corona que distribuye @Homecenter_co se exhibe en su sitio web completamente verde, con boquilla V… ', '', '', '0', '0', 'pos', '0.645349', '0.354651' ),
( '1286765733318463492', '1368220597', '#SiSePuede
Un gran mensaje y llamado hace a los monterianos, el hijo del pueblo, el concejal @HalpLicona , todos un… ', '', '', '0', '0', 'pos', '0.5375', '0.4625' ),
( '1286806491832430593', '1368220597', '#publicidad 
La receta secreta del Bisabuelo, Lorica (1905)
Jamón artesanal con proceso natural, libre de químicos… ', '', '', '0.4', '0.1', 'pos', '0.609073', '0.390927' ),
( '1286825505594003457', '1368220597', '#PaLaCarcel
Betty “EL ÁCIDO” Paternina, es la DELINCUENCIA en su máximo ESPLENDOR, por su posición GARANTE frente a… ', '', '', '0', '0', 'neg', '0.375', '0.625' ),
( '1287013751229751296', '1368220597', '#Corrupción: exgerente del hospital San Diego, Betty Paternina, irá a juicio de responsabilidad fiscal ', '', '', '0', '0', 'pos', '0.665742', '0.334258' ),
( '1287114925027057665', '1368220597', 'RT @ElNegrovicto: #PaLaCarcel
Betty “EL ÁCIDO” Paternina, es la DELINCUENCIA en su máximo ESPLENDOR, por su posición GARANTE frente al Hosp…', '', '', '0', '0', 'neg', '0.375', '0.625' ),
( '1287114953464467460', '1368220597', 'RT @ElNegrovicto: #Corrupción: exgerente del hospital San Diego, Betty Paternina, irá a juicio de responsabilidad fiscal ', '', '', '0', '0', 'pos', '0.665742', '0.334258' ),
( '1287134072016457731', '1368220597', 'Concejal Leonel Márquez solicitó declarar estado de calamidad pública en Montería  @LEONELMARQUEZS', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1287140426340851713', '1368220597', '#Recordemos
En está época de PANDEMIA me acuerdo del gran ÑOÑO ELÍAS, cuanta falta haces, un hombre NOBLE y de buen… ', '', '', '0.9', '0.6', 'pos', '0.5', '0.5' ),
( '1287151088743919616', '1368220597', '#SoledadEnMonteria
Tuvieron que llegar los MUERTOS, empezaron a CREMAR a los amigos, hermanos, padres, primos, veci… ', '', '', '0', '0', 'neg', '0.279221', '0.720779' ),
( '1287186007796912128', '1368220597', '#ManoDura 
Esta es la clase de dirigentes que requiere el pueblo, en la corporación @concejomonteria necesitamos 18… ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1287394849436635138', '1368220597', 'RT @ElNegrovicto: #SoledadEnMonteria
Tuvieron que llegar los MUERTOS, empezaron a CREMAR a los amigos, hermanos, padres, primos, vecinos, a…', '', '', '0', '0', 'neg', '0.279221', '0.720779' ),
( '1287481289428402178', '1368220597', 'presidente @AlvaroUribeVel en CÓRDOBA el @CeDemocratico necesita congredistas de la estirpe de @AmandaRocioGon1 muj… ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1287568025160425472', '1368220597', '#TalCual
El bombardero @Ivan9Valenciano fue un GOLEADOR brillante, hizo historia en @JuniorClubSA y hoy sigue BRILL… ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1287578562267156480', '15632696', '@charoguerra @IvanDuque Charito, recuerda que el presidente es "Jefe de Estado" y "Jefe de Gobierno", por lo tanto… ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1287594016972902402', '1368220597', '#LoUltimo
Toque de queda y ley seca desde el miércoles 29 de julio hasta el lunes 3 de agosto en Montería ', '', '', '0', '0', 'neg', '0.0625', '0.9375' ),
( '1287700673333809158', '1368220597', 'RT @ElNegrovicto: presidente @AlvaroUribeVel en CÓRDOBA el @CeDemocratico necesita congredistas de la estirpe de @AmandaRocioGon1 mujer con…', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1287705687892664321', '1368220597', 'RT @ElNegrovicto: #TalCual
El bombardero @Ivan9Valenciano fue un GOLEADOR brillante, hizo historia en @JuniorClubSA y hoy sigue BRILLANDO c…', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1287737620991283201', '1368220597', 'RT @ElNegrovicto: #OjoAlDato
Si algo ha demostrado @orlandobenitezm es ser un hombre CORRECTO, que conoce y quiere a su DPTO, atrás quedaro…', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1287812089973743617', '1368220597', '#QueVerguenza 
Las ‘burradas’ del alcalde de Montelíbano, Jose David Cura, en plena pandemia ', '', '', '0', '0', 'neg', '0.145282', '0.854718' ),
( '1287812518551916546', '1368220597', '#Opinion 
Retomar el norte para recuperar el sur ', '', '', '0', '0', 'pos', '0.801471', '0.198529' ),
( '1287813815573372931', '1368220597', 'Comparto este artículo publicado en la Lengua Caribe sobre violencia en el sur de Córdoba. Retomar el norte para re… ', '', '', '0', '0', 'pos', '0.75', '0.25' ),
( '1287815184317386754', '1368220597', '#OjoAlDato
Las MEDIDAS restrictivas del alcalde de Montería @caordosgoitia obedecen al compartamiento IRRESPONSABLE… ', '', '', '0', '0', 'neg', '0.378049', '0.621951' ),
( '1287896411355447296', '1368220597', 'Histórico: alcaldes de San Andrés de Sotavento, Tuchín y Chimá, inauguraron sede del Cuerpo de Bomberos ', '', '', '0', '0', 'pos', '0.537037', '0.462963' ),
( '1287907323869114368', '1368220597', 'Dicen en Chinú que uno no puede vivir toda la vida siendo bandido, que algún día tiene que arrepentirse y pedirle p… ', '', '', '0', '0', 'neg', '0.0357143', '0.964286' ),
( '1287918653913038848', '1368220597', 'La belleza y profesionalismo de la presentadora María Camila Orozco, tiene cautivados a los televidentes… ', '', '', '0', '0', 'pos', '0.5375', '0.4625' ),
( '1287928182960721928', '1368220597', '#Bandidos
La @Contraloria_Cba es un antro de CORRUPCION, IMPUDICIA Y SANTIFICACIÓN, el director de la orquesta, and… ', '', '', '0', '0', 'neg', '0.475528', '0.524472' ),
( '1288100295894077440', '1368220597', 'En Córdoba, para la gente irresponsable y desobediente los únicos culpables del alto índice de contagios de #Covid-… ', '', '', '0', '0', 'pos', '0.5375', '0.4625' ),
( '1288100804361166848', '1368220597', 'RT @ElNegrovicto: #Bandidos
La @Contraloria_Cba es un antro de CORRUPCION, IMPUDICIA Y SANTIFICACIÓN, el director de la orquesta, anda con…', '', '', '0', '0', 'neg', '0.475528', '0.524472' ),
( '1288119426760359937', '15632696', '@MariaFdaCabal Señora, ¡KYC!', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1288207994170281984', '1368220597', 'Las cosas como deben ser: Alcalde de Lorica @Jorgenegretelpz  se amarró los pantalones y se atrevió a realizar el D… ', '', '', '0', '0', 'neg', '0.413975', '0.586025' ),
( '1288254918156062721', '1368220597', 'No decir nada y guardar silencio ante semejante tragedia que vivimos en Montería y Córdoba, no es que yo haga parte… ', '', '', '0', '0', 'pos', '0.75', '0.25' ),
( '1288255464476676096', '1368220597', 'Se cayó el acuerdo que privatizaba el ICA: congresista cordobés Erasmo Zuleta celebró la decisión  @ErasmoZB', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1288462107420262400', '1368220597', '#OjoAlDato 
Estoy por creer que todo el que crea una cuenta fake en Twitter es resentido, envidioso, cabrón, incapa… ', '', '', '1', '-0.5', 'neg', '0.326667', '0.673333' ),
( '1288470625674244098', '1368220597', 'Alguien tiene que responder  por el parque de Caño Viejo Margen izquierda. @monterialcaldia , contratistas, interve… ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1288512792367046656', '1368220597', 'RT @ElNegrovicto: La belleza y profesionalismo de la presentadora María Camila Orozco, tiene cautivados a los televidentes ', '', '', '0', '0', 'pos', '0.5375', '0.4625' ),
( '1288522110781063168', '1368220597', 'Será que el @SecGobMonteria, @GabrielMorenoG_, va a permitir que se roben la zona verde de la 22 al lado de Tacasua… ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1288538138424610816', '1368220597', 'Cordobés que hoy no se sienta orgulloso del senador @davidbarguil esta muerto en vida.
Excelente trabajo congresist… ', '', '', '0', '0', 'neg', '0.25', '0.75' ),
( '1288540534622097408', '1368220597', 'Más de 6 mil familias cordobesas resultaron beneficiadas con el programa Seguridad Alimentaria #UnidosNosCuidamos :… ', '', '', '0', '0', 'neg', '0.377551', '0.622449' ),
( '1288594378139799559', '1368220597', 'Me le quito el sombrero al @SecGobMonteria @GabrielMorenoG_ en menos de 5 horas dio orden expresa para retirar el e… ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1288813845616574464', '1368220597', 'RT @ElNegrovicto: Será que el @SecGobMonteria, @GabrielMorenoG_, va a permitir que se roben la zona verde de la 22 al lado de Tacasuan, sr…', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1288815462365552641', '1368220597', 'RT @ElNegrovicto: Alguien tiene que responder  por el parque de Caño Viejo Margen izquierda. @monterialcaldia , contratistas, interventoria…', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1288818244313178112', '1368220597', '#OjoAlDato
Joven que tenga como ídolo o ejemplo a @DiomedesDiaz será un completo FRACASO, por que como el mismo lo… ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1288820915397066752', '1368220597', 'El mayor lujo en la vida es ser feliz.', '', '', '0', '0', 'neg', '0.166667', '0.833333' ),
( '1288834786967146497', '15632696', '@Homecenter_co El cumpleaños HomeCenter te está llamando. #CumpleanosHomecenter', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1288836356484091904', '15632696', '@Homecenter_co Celebra en casa, Homecenter te está llamando. #CumpleanosHomecenter', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1288836595634905089', '15632696', '@Homecenter_co Celebra en casa, el cumpleaños Homecenter te está llamando. #CumpleanosHomecenter', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1288837910385569798', '15632696', '@vill_a_veces @Homecenter_co Jaja,  Excelente. Buena observación.', '', '', '0', '0', 'pos', '0.75', '0.25' ),
( '1288840436581367809', '1368220597', '#CórdobaTieneSenador
Córdoba necesita MÁS senadores como @davidbarguil el no solo trabaja en épocas normales, ante… ', '', '', '0', '0', 'pos', '0.566667', '0.433333' ),
( '1288842406167814145', '15632696', '@Homecenter_co Set 1 Almohada Firme Ray + 1 Almohada Carbono Media
SKU: 482030

#CumpleanosHomecenter', '', '', '0', '0', 'pos', '0.604051', '0.395949' ),
( '1288843003105337345', '15632696', '@Homecenter_co @FabianchoMartin Le faltó el código o SKU. ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1288843346425851907', '15632696', '@Homecenter_co Faltó el código o SKU exacto. ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1288845528793526272', '15632696', '@Homecenter_co El copy dice una cosa y la imagen otra. ', '', '', '0', '0', 'neg', '0.329808', '0.670192' ),
( '1288848220228071424', '1368220597', 'ADVERTENCIA 
En el sur de Montería los puntos de @RedServiciosCor son el principal propagador del #CORONAVIRUS y… ', '', '', '0', '0', 'pos', '0.851417', '0.148583' ),
( '1288850316453085186', '1368220597', 'Para salvar vidas: donación de plasma de pacientes recuperados de Covid-19, propuesta del concejal monteriano Leone… ', '', '', '0', '0', 'neg', '0.25', '0.75' ),
( '1288893671732060160', '1368220597', '#Reflexion
En estos momentos cuando la pandemia de la COVID-19 golpea despiadadamente a Santa Cruz de Lorica, la ex… ', '', '', '0', '0', 'neg', '0.478947', '0.521053' ),
( '1288916525898960897', '1368220597', 'RT @lalenguacaribe_: #Judicial | Apuñalaron a hombre que habría intentado violar a una menor en el sur de Montería ', '', '', '0', '0', 'pos', '0.75', '0.25' ),
( '1288916773937569794', '1368220597', '#Loultimo
Apuñalaron a hombre que habría intentado violar a una menor en el sur de Montería ', '', '', '0', '0', 'pos', '0.75', '0.25' ),
( '1288945470535065605', '1368220597', '#SíSePuede
En política hay que ser coherente con el discurso, en plena campaña el atraco de la salud en Córdoba fue… ', '', '', '0', '0', 'pos', '0.752033', '0.247967' ),
( '1288949509867872257', '1368220597', 'Por denuncias de corrupción que involucran a abogada Angélica Negrete, suspendieron proceso de licitación en Valenc… ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1289038387861762049', '1368220597', 'La corrupción y los elefantes blancos de la exalcaldesa de Chinú, Teresa Salamanca  @PGN_COL… ', '', '', '0', '0', 'neg', '0.142384', '0.857616' ),
( '1289145259675594753', '1368220597', 'Las tormentas son temporales, pero las bendiciones de Dios son para siempre.', '', '', '0', '0', 'neg', '0.452884', '0.547116' ),
( '1289278819317121024', '1368220597', 'El Loriquero no aprende, Tan difícil es 1. GUARDA LA DISTANCIA ..... 2 MTS
2. Usar el tapabocas; 
3. Lávarse las ma… ', '', '', '0', '0', 'pos', '0.645833', '0.354167' ),
( '1289284491719200769', '1368220597', 'El Sabor de la mujer costeña es lo mejor que hay en Colombia. El que diga lo contrario que se ahorque. ', '', '', '0', '0', 'pos', '0.892857', '0.107143' ),
( '1289292542639472642', '1368220597', 'RT @ElNegrovicto: Un S.O.S al presidente @IvanDuque para terminar el Hospital San José de Tierralta el cual brindará atención a toda la reg…', '', '', '0', '0', 'neg', '0.321672', '0.678328' ),
( '1289300264030265344', '1368220597', 'RT @ElNegrovicto: La corrupción y los elefantes blancos de la exalcaldesa de Chinú, Teresa Salamanca  @PGN_COL @Fisc…', '', '', '0', '0', 'neg', '0.142384', '0.857616' ),
( '1289300415578640385', '1368220597', 'No más EPS de Negocio$ Esta han sido lo peor en pandemia y antes de ella.

Concejal @LEONELMARQUEZS buen punto! ', '', '', '0', '0', 'neg', '0.416667', '0.583333' ),
( '1289314486856241152', '1368220597', '#SeguroQueSi
Le cae la MAE en CÓRDOBA el que compre comida o producto CHINO, estos DEGENERADOS fabricaron el COVID-… ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1289346758300954624', '1368220597', 'Nadie estaba preparado para estos momentos tan difíciles, hay aciertos y equivocaciones, es tiempo de aunar esfuerz… ', '', '', '0', '0', 'pos', '0.9375', '0.0625' ),
( '1289352162221400069', '1368220597', 'La humildad se denota en aceptar un mal juicio de apreciación, Reconozco el valor del Gobernador @orlandobenitezm a… ', '', '', '0', '0', 'pos', '0.75', '0.25' ),
( '1289352201056354305', '1368220597', 'La humildad se denota en aceptar un mal juicio de apreciación, Reconozco el valor del Gobernador al discernir cada… ', '', '', '0', '0', 'pos', '0.75', '0.25' ),
( '1289369932199845891', '1368220597', 'Esto sucedió en España en el pico de la pandemia con un sistema de salud robusto. Del autocuidado e identificar los… ', '', '', '0', '0', 'neg', '0.377551', '0.622449' ),
( '1289512255248142337', '1368220597', 'Exigir es fácil, señalar es fácil, juzgar es fácil, condenar es fácil, quejarse es fácil, pero dar el ejemplo es realmente lo difícil!', '', '', '0', '0', 'pos', '0.75', '0.25' ),
( '1289531109567471617', '1368220597', 'RT @ElNegrovicto: La humildad se denota en aceptar un mal juicio de apreciación, Reconozco el valor del Gobernador @orlandobenitezm al disc…', '', '', '0', '0', 'pos', '0.75', '0.25' ),
( '1289538692638416897', '1368220597', 'Existe el delito de "Dormirse" ? Según los eruditos al patrullero Walter Fuentes Fálon, fue capturado en la finca e… ', '', '', '0', '0', 'neg', '0.474763', '0.525237' ),
( '1289541372429471744', '1368220597', 'RT @orlandobenitezm: Hoy comienza el octavo mes del año. Dios nos ilumine y guíe en cada pensamiento,acción y decision. Lleno de fe, espera…', '', '', '0', '0', 'pos', '0.513333', '0.486667' ),
( '1289594929505660929', '1368220597', 'Felicito al periodista @GudilfredoAv por su exquisito gusto. Los envidiosos que por favor superen, en la vida se va… ', '', '', '0', '0', 'neg', '0.137569', '0.862431' ),
( '1289598470928523265', '1368220597', 'En este orden ...
muertes en Montería, después del ##Covid19... La Envidia.', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1289622576176668673', '1368220597', 'Gracias Dios por todas tus bendiciones y por proteger a mi familia. ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1289641087515189248', '1368220597', '#Sinvengüenzas
Si tú sabes quienes son los SOCIOS CRIMINALES de la  Clínica La Esperanza (Evaluamos IPS Ltda), te i… ', '', '', '0', '0', 'neg', '0.345356', '0.654644' ),
( '1289666312684224512', '1368220597', '#Covid19
Hace un mes me hice prueba de hisopado, al no entregarme resultados el día 25 de julio me practiqué otra p… ', '', '', '0', '0', 'neg', '0.166667', '0.833333' ),
( '1289749342153134082', '1368220597', '#FueraWin
cadena privada @WinSportsTV debe coger ejemplo del @canaluno qué trasmite gratis partidos de la liga mexi… ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '1289870180995067906', '1368220597', '"Para tener enemigos no falta declararle la guerra a nadie;  sólo basta que te esté yendo bien"', '', '', '0', '0', 'pos', '0.75', '0.25' ),
( '1289897059877699584', '1368220597', 'Hoy domingo de cuarentena, amaneci arreglando los bocachicos de la semana.
Que nostalgia recordar mi época de prsca… ', '', '', '0', '0', 'pos', '0.721196', '0.278804' ),
( '1289933047408791552', '1368220597', '#Infamia
Si la @CorteSupremaJ mete preso a @AlvaroUribeVel sería el recrudecimiento de la violencia en Colombia, na… ', '', '', '0', '0', 'neg', '0.25', '0.75' ),
( '1289943526822699009', '1368220597', '#ElbandidoEsBandido
Pocas veces me equivoco, lo dije y lo sostengo y si lo dice @ElNegrovicto pongale la firma ...!… ', '', '', '0', '0', 'neg', '0.12069', '0.87931' ),
( '1289985495523454976', '1368220597', 'RT @ElNegrovicto: Las cosas como deben ser: Alcalde de Lorica @Jorgenegretelpz  se amarró los pantalones y se atrevió a realizar el Día sin…', '', '', '0', '0', 'neg', '0.413975', '0.586025' ),
( '1290002966938816512', '1368220597', '#NoMeDetendran
Así como son autores intelectuales de los HOMICIDIOS y que apreitan el GATILLO para ASESINAR, tambié… ', '', '', '0', '0', 'pos', '0.6128', '0.3872' ),
( '1290014587690024960', '1368220597', 'Esta tendencia nacional sólo pasa en Colombia... Sin mas comentarios. ', '', '', '0', '0', 'pos', '0.5625', '0.4375' ),
( '574283922139447297', '92553187', 'Plan Nacional de Desarrollo 2014-2018 #cerete Apostando por el caribe ', 'city', 'Cereté', '0', '0', 'pos', '0.630102', '0.369898' ),
( '578540615958401024', '92553187', 'Desayunando pastel rumbo a la guajira (@ Olga Piña y Juana Luna in Corozal, Sucre Dept) ', 'city', 'Corozal', '0', '0', 'pos', '0.833333', '0.166667' ),
( '578543494786117632', '92553187', 'Desayunando donde Olga Piña la segunda mama de diomedez ', '', '', '0', '0', 'pos', '0.7', '0.3' ),
( '578630840537722880', '92553187', 'I\'m at Restaurante Bar-Parrilla El Rancho ', 'city', 'Ciénaga', '0', '0', 'pos', '0.5', '0.5' ),
( '578712090409570304', '92553187', 'Rioacha #festivalvallenato #fransicoelhombre ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '578753794575585281', '92553187', 'Maicao Internasional ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '578979037885939713', '92553187', '#A un pado de Venezuela ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '578979065429884928', '92553187', '#ingenieria ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '578980355841085441', '92553187', 'Acabo de publicar una foto ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '578981089764618240', '92553187', 'Acabo de publicar una foto ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '578982730899320832', '92553187', 'Acabo de publicar una foto ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '578983260727975936', '92553187', 'Acabo de publicar una foto ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '578984033255858176', '92553187', 'Cerrejón ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '579022570634289152', '92553187', 'Donde ricky #maicao ', '', '', '0', '0', 'neg', '0.46875', '0.53125' ),
( '579794594667180032', '92553187', 'Acabo de publicar una foto ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '579839859038224384', '92553187', 'Acabo de publicar un vídeo ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '579840887812853762', '92553187', 'Acabo de publicar un vídeo ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '579848544653307905', '92553187', 'Chivo Asado ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '590645362081325059', '92553187', 'Resultados de la convocatoria 693 de 2014 de reconocimiento de grupos
de investigación e investigadores. ', 'admin', 'Córdoba', '0', '0', 'pos', '0.65', '0.35' ),
( '595031054806814720', '92553187', 'My Samsung Galaxy S6 edge got 67128 points @AnTuTuLabs. What about your scores? Come and show your scores...&lt;', '', '', '0', '0', 'pos', '0.699372', '0.300628' ),
( '595082802531532800', '92553187', 'Acabo de publicar una foto ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '598334784511680512', '92553187', 'Nueva favorita: Plan B / Fanática Sensual  @DeezerColombia', '', '', '0', '0', 'pos', '0.784958', '0.215042' ),
( '599726270155481088', '92553187', 'Nueva favorita: Pasabordo / La Cura  @DeezerColombia', '', '', '0', '0', 'pos', '0.65', '0.35' ),
( '601893529628053504', '92553187', 'Celebración Día del Maestro #unisinu ', '', '', '0', '0', 'pos', '0.8125', '0.1875' ),
( '601904454225555456', '92553187', 'Día del Maestro ', '', '', '0', '0', 'pos', '0.8125', '0.1875' ),
( '601919244763340800', '92553187', 'Celebración dia del maestro con Lucho Chamie #unisinu', '', '', '0', '0', 'pos', '0.585973', '0.414027' ),
( '602289265515565056', '92553187', 'Nuevo favorito: Deezerlist Musica Relajante de Carlos Mejia  @DeezerColombia', '', '', '0', '0', 'pos', '0.65', '0.35' ),
( '602725605365415936', '92553187', 'Nueva favorita: Mauricio Rivera / Un Beso (feat. Zion)  @DeezerColombia', '', '', '0', '0', 'pos', '0.837629', '0.162371' ),
( '602725794176196608', '92553187', 'Nueva favorita: Major Lazer / Lean On (feat. MØ &amp; DJ Snake)  @DeezerColombia', '', '', '0.5', '0.0625', 'pos', '0.929013', '0.0709871' ),
( '602725869686235137', '92553187', 'Nueva favorita: Fontta &amp; Fullbeta / Miénteme  @DeezerColombia', '', '', '0', '0', 'pos', '0.65', '0.35' ),
( '602725907393028096', '92553187', 'Nueva favorita: Colacho Mendoza / Bonita (Album Version)  @DeezerColombia', '', '', '0', '0', 'pos', '0.694587', '0.305413' ),
( '602726184284200960', '92553187', 'Nueva favorita: Maluma / El Tiki  @DeezerColombia', '', '', '0', '0', 'pos', '0.65', '0.35' ),
( '603612128382230528', '92553187', 'I\'m at Sand Marino Restaurante in Montería, Córdoba ', 'city', 'Montería', '0', '0', 'neg', '0.215909', '0.784091' ),
( '619148042881601540', '92553187', 'Diamante Caribe &amp; Santanderes ', '', '', '0', '0', 'pos', '0.65', '0.35' ),
( '619304199252217856', '92553187', 'RT @AppsCo: ¿Ya te inscribiste al #Bootcamp en Montería?, Julio 15, regístrate en #ConvocatoriasAppsCo --&gt;  .…', '', '', '0', '0', 'neg', '0.110169', '0.889831' ),
( '619304833850441729', '92553187', 'RT @CHICACERETE: Con @Ministerio_TIC se trabaja en la organización del Foro Semana Ciudades i @camarpu invita a @unisinumonteria …', '', '', '0', '0', 'pos', '0.529736', '0.470264' ),
( '619520313030778880', '92553187', 'RT @ingrathaday: Pilas emprendedores #Montería! todos listos para ir al #bootcamp #ConvocatoriasAppsCo @unisinumonteria @SENAComunica http:…', '', '', '0', '0', 'neg', '0.382353', '0.617647' );

INSERT INTO `data_twitter_detalle`(`id`,`usuario`,`text`,`place_type`,`place`,`sentiment`,`polarity`,`classification`,`p_pos`,`p_neg`) VALUES 
( '619521934678728704', '92553187', 'RT @AppsCo: Feliz sábado #Emprendedores, recuerden que estamos en modo #ConvocatoriasAppsCo ¿Tienes una idea? ', '', '', '0', '0', 'pos', '0.575008', '0.424992' ),
( '619539088568381440', '92553187', 'RT @AppscoMacondo: #Emprendedores #Montería #Sincelejo #SanAndrés #Atlántico Descubrimiento de Negocios TIC aquí  ht…', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '619702593279918080', '92553187', '"Cómo descargar OS X El Capitan, el nuevo sistema operativo de la Mac?"  #tecnologia', '', '', '0', '0', 'neg', '0.375', '0.625' ),
( '620718233478426624', '92553187', '#Unisinu ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '620720177626382336', '92553187', 'RT @AppscoMacondo: #Montería nos vemos el 15 de julio en el Auditorio Elías Bechara Zainún de @unisinumonteria  http…', '', '', '0', '0', 'neg', '0.166667', '0.833333' ),
( '621141498298540032', '92553187', 'Sí, los puentes también pueden ser capaces de producir energía renovable  #tecnologia', '', '', '0', '0', 'pos', '0.683374', '0.316626' ),
( '621298252068057088', '92553187', 'RT @CHICACERETE: Hoy en Montería 8am @unisinumonteria 1er Bootcamp Un espacio para emprendedores de Tic Asiste y participa, ', '', '', '0', '0', 'neg', '0.382353', '0.617647' ),
( '621318367400562689', '92553187', 'RT @InformaRSE_col: Estamos en el Bootcamp Montería de @AppsCo @AppscoMacondo preparando nuestra propuesta de emprendimiento digital.  ht…', '', '', '0', '0', 'neg', '0.297468', '0.702532' ),
( '621318561697505280', '92553187', 'RT @AppscoMacondo: #BootCamp #Montería #ConvocatoriasAppsCo @Caribetic @Camarabaq @unisimon @AppsCo @Colciencias @Ministerio_TIC …', '', '', '0', '0', 'neg', '0.382353', '0.617647' ),
( '621324309051625472', '92553187', 'RT @ingrathaday: Iniciamos  nuestra jornada de #bootcamp  #Montería con @AppsCo @AppscoMacondo @ingededreu @manuelpachon @pamars …', '', '', '0', '0', 'neg', '0.272985', '0.727015' ),
( '621343522310983680', '92553187', 'RT @CHICACERETE: A ésta hora en Aud. Elias Bechara @unisinumonteria se realiza Bootcamp con @AppsCo @AppscoMacondo #OfertaTic presente http…', '', '', '0', '0', 'pos', '0.502717', '0.497283' ),
( '621351086142697473', '92553187', 'Resumen fotografico Bootcamp Montería con miembros de @Ministerio_TIC @AppsCo @AppscoMacondo  @42xy @unisinumonteria ', 'city', 'Montería', '0', '0', 'neg', '0.272985', '0.727015' ),
( '621413261045559297', '92553187', '#Canvas describe la lógica de cómo una organización crea, entrega y captura valor.  @AppsCo y @Ministerio_TIC ', 'city', 'Montería', '0', '0', 'pos', '0.957729', '0.0422705' ),
( '621413362841292800', '92553187', 'RT @AppscoMacondo: Continuamos con los #Emprendedores de #Montería #BootCamp #ConvocatoriasAppsCo #InnovaciónSinLímites ', '', '', '0', '0', 'neg', '0.303804', '0.696196' ),
( '621413757797974016', '92553187', 'RT @AppscoMacondo: Seguimos trabajando con #Emprendedores. #Montería #BootCamp #ConvocatoriasAppsCo #InnovaciónSinLímites ', '', '', '0', '0', 'neg', '0.272985', '0.727015' ),
( '621414146580594688', '92553187', 'RT @AppscoMacondo: Networking intercambio de ideas de #Emprendedores #Montería #BootCamp #ConvocatoriasAppsCo #InnovaciónSinLímites http://…', '', '', '0', '0', 'neg', '0.302966', '0.697034' ),
( '621430430764544000', '92553187', 'RT @AppscoMacondo: #lluviadeideas #Emprendedores #Montería #BootCamp #ConvocatoriasAppsCo #InnovaciónSinLímites @Ministerio_TIC @AppsCo htt…', '', '', '0', '0', 'neg', '0.25', '0.75' ),
( '621430531012567042', '92553187', 'RT @AppscoMacondo: @AppscoMacondo es #InnovaciónSinLímites en #Montería #Sincelejo #SanAndrés #Atlántico Ingresa  ht…', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '621450300747026432', '92553187', 'RT @AppscoMacondo: Así termina el exitoso #BootCamp #ConvocatoriasAppsCo #InnovaciónSinLímites @Ministerio_TIC @AppsCo @unisimon …', '', '', '0', '0', 'neg', '0.382353', '0.617647' ),
( '629030382013448192', '92553187', 'RT @MCarolinaHoyosT: MontMov es una aplicación que pretende mejorar la movilidad en Montería, ganadora en #Ciudades_i ', '', '', '0', '0', 'pos', '0.65', '0.35' ),
( '629030498979942400', '92553187', 'RT @monterialcaldia: Rodrigo García con la aplicación MontMov ganó concurso ideas Tic para ayudar a mejorar movilidad en #Montería …', '', '', '0', '0', 'neg', '0.441628', '0.558372' ),
( '629092250023260160', '92553187', 'RT @ForosSemana: App para la movilidad de #Montería. @Raxielh y su equipo: ganadores en foro #Ciudades_i &gt;&gt;  …', '', '', '0', '0', 'pos', '0.65', '0.35' ),
( '633279589784154112', '92553187', '#ingenieria #meridiano ', '', '', '0', '0', 'pos', '0.65', '0.35' ),
( '636210446740115456', '92553187', 'RT @acofi: Proyecto MonttMov de la Universidad del Sinú, ganador de la convocatoria de MinTic. Aplicación que mejorará la movilidad en Mont…', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '636211923701395456', '92553187', '@acofi Gracias por su felicitación, que sigan apoyando la formación del ingeniero en el país. ¡Felicitaciones por sus 40 años!', 'city', 'Montería', '0', '0', 'pos', '0.75', '0.25' ),
( '636212057734561792', '92553187', 'RT @acofi: Premio Mintic ganado por Universidad del Sinú, muestra aporte de la ingenieria nacional al desarrollo regional.', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '636216035759255552', '92553187', '@acofi Gracias por su felicitación, que sigan apoyando la formación del ingeniero en el país. ¡Felicitaciones por sus 40 años!', 'city', 'Montería', '0', '0', 'pos', '0.75', '0.25' ),
( '638362748242513920', '92553187', 'cities for life global meeting ', '', '', '0', '0', 'pos', '0.917783', '0.0822167' ),
( '644587927993995264', '92553187', 'UNISINU PRESENTE EN EL ENCUENTRO INTERNACIONAL DE EDUCACIÓN EN INGENIERÍA ACOFI 2015 @acofi ', 'city', 'Cartagena', '0', '0', 'pos', '0.847826', '0.152174' ),
( '644589803334320132', '92553187', 'SISTEMA DE VISIÓN COMPUTACIONAL PARA LA DETERMINACIÓN DE LOS NIVELES DE SERVICIOS EN VÍAS PEATONALES... ', 'city', 'Cartagena', '0', '0', 'pos', '0.683374', '0.316626' ),
( '644646701274415104', '92553187', 'UNISINÚ PRESENTE EN ENCUENTRO INTERNACIONAL DE INGENIERÍA ', '', '', '0', '0', 'pos', '0.65', '0.35' ),
( '645022327684628480', '92553187', 'Excelente evento @acofi como siempre una organización impecable. ', 'city', 'Cartagena', '0', '0', 'pos', '0.65', '0.35' ),
( '645974168920551424', '92553187', 'Colciencias en las Regiones ', '', '', '0', '0', 'pos', '0.530263', '0.469737' ),
( '647532483538460672', '92553187', 'RT @TuPlanBMtr: Ahora, @Raxielh  cuenta detalles sobre  su idea de app de movilidad que ganó  convocatoria de @monterialcaldia ', '', '', '0', '0', 'pos', '0.575008', '0.424992' ),
( '647532506741383168', '92553187', 'RT @TuPlanBMtr: @Raxielh ganador de la App de Movilidad para Montería, nos cuenta detalles del avance del desarrollo de la aplicación http:…', '', '', '0', '0', 'pos', '0.65', '0.35' ),
( '650101466452111360', '92553187', 'Celebración Ingeniero Guillermo Mariño Rodríguez the best boss ', '', '', '0.3', '1', 'neg', '0.474905', '0.525095' ),
( '650108851962937344', '92553187', 'Cumpleaños con el mejor Decano #facultaddecienciaseingenierias ', '', '', '0', '0', 'pos', '0.529736', '0.470264' ),
( '650128794368483328', '92553187', 'Social Drink ', '', '', '0.0666667', '0.0333333', 'pos', '0.808458', '0.191542' ),
( '652293271071408128', '92553187', 'CC Florida ', '', '', '0', '0', 'pos', '0.772031', '0.227969' ),
( '665035565344169984', '92553187', 'Feliz cumpleaños @42xy ', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '665041527639564288', '92553187', 'Que ternurita @42xy #cute ', '', '', '1', '0.5', 'pos', '0.504717', '0.495283' ),
( '682727019973586944', '92553187', 'Así como cuando descubres que tu abuelo fue Maestro Jedi. ', '', '', '0', '0', 'pos', '0.905594', '0.0944056' ),
( '691621384900997120', '92553187', 'I\'m at Universidad del Sinú - @unisinu_prensa in Montería, Córdoba ', 'city', 'Montería', '0', '0', 'pos', '0.5', '0.5' ),
( '745720262428135425', '92553187', 'RT @CHICACERETE: Quieres estudiar una Carrera TI y no tienes plata para matricularte?  @Ministerio_TIC te da Crédito Condonable …', '', '', '0', '0', 'neg', '0.25', '0.75' ),
( '765692855365070849', '92553187', 'RT @eDaysCo: Amigos de @internautismo nos acompañarán en Montería y Sincelejo en #eDays2016. RT si te gusta. ', '', '', '0', '0', 'neg', '0.25', '0.75' ),
( '875808066536603648', '92553187', 'RT @C1Palomino: Confirmado capturan a actual alcalde de Monteria Marcos Daniel Pineda y a Carlos Eduardo Correa por corrupción en Córdoba @…', '', '', '0.1', '0', 'pos', '0.553787', '0.446213' ),
( '880086517993099264', '92553187', '@chemaalonso Hola Chema no te interesa dar un charla en Colombia invita Universidad del Sinú', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '976151956023578624', '92553187', '', '', '', '0', '0', 'pos', '0.5', '0.5' ),
( '983808932648046592', '92553187', 'RT @NattiRueda: Esta es la nueva modalidad para alterar taxímetros en Bogotá. Este conductor fue sorprendido por la Policía en el aeropuert…', '', '', '0', '0', 'pos', '0.642857', '0.357143' ),
( '993598845522206722', '92553187', 'RT @freddier: Hoy un candidato a presidente de Colombia propuso que los taxis sean eléctricos (OK) y que tengan paneles solares.

No existe…', '', '', '0.5', '0.5', 'neg', '0.10101', '0.89899' );
COMMIT;
/*!40000 ALTER TABLE `data_twitter_detalle` ENABLE KEYS */

-- ---------------------------------------------------------


-- Dump data of "redes_sociales" ---------------------------
/*!40000 ALTER TABLE `redes_sociales` DISABLE KEYS */

BEGIN;

INSERT INTO `redes_sociales`(`id`,`nombre`,`create`,`update`) VALUES 
( '1', 'Twiiter', '2020-07-28 19:51:00', '2020-07-28 19:51:00' ),
( '2', 'Facebook', '2020-07-28 19:51:09', '2020-07-28 19:51:09' ),
( '3', 'Instagram', '2020-07-28 19:51:17', '2020-07-28 19:51:17' );
COMMIT;
/*!40000 ALTER TABLE `redes_sociales` ENABLE KEYS */

-- ---------------------------------------------------------


-- Dump data of "users_sis" --------------------------------
/*!40000 ALTER TABLE `users_sis` DISABLE KEYS */

BEGIN;

INSERT INTO `users_sis`(`id`,`nombre`,`correo`,`password`) VALUES 
( '13', 'Rodrigo', 'rodrigo@gmail.com', 'SAsvGnJ7itXgk' ),
( '14', 'rodrigo', 'rodrigo2@gmail.com', 'SAsvGnJ7itXgk' ),
( '15', 'rodrigo', 'rodrigo00@gmail.com', 'SAsvGnJ7itXgk' ),
( '16', 'rodrigo', 'rodrigo9@gmail.com', 'SAsvGnJ7itXgk' ),
( '17', 'rodrigo', 'ro99drigo@gmail.com', 'SAsvGnJ7itXgk' ),
( '18', 'rodrigo', 'rodrigo@gmail.com88', 'SAsvGnJ7itXgk' ),
( '19', 'rodrigo', 'rodrigo99@gmail.com', 'SAsvGnJ7itXgk' );
COMMIT;
/*!40000 ALTER TABLE `users_sis` ENABLE KEYS */

-- ---------------------------------------------------------


-- CREATE INDEX "lnk_redes_sociales_cuentas" -------------------
CREATE INDEX `lnk_redes_sociales_cuentas` USING BTREE ON `cuentas`( `red_social` );
-- -------------------------------------------------------------


-- CREATE LINK "lnk_redes_sociales_cuentas" --------------------
ALTER TABLE `cuentas`
	ADD CONSTRAINT `lnk_redes_sociales_cuentas` FOREIGN KEY ( `red_social` )
	REFERENCES `redes_sociales`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


