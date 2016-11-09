create database FindMyAndy;
use FindMyAndy;
-- -----------------------------------------------------
-- Table `mydb`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE usuarios (
  idUsuario INT(10) NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(20) NULL,
  apellidoP VARCHAR(20) NULL,
  apellidoM VARCHAR(45) NULL,
  ciudad VARCHAR(30) NULL,
  genero VARCHAR(1) NULL,
  email varchar(50) NOT NULL,
  fechaNacimiento DATE NULL DEFAULT NULL,
  password varchar(50) NOT NULL,
  PRIMARY KEY (idUsuario));
  

  
-- -----------------------------------------------------
-- Table `mydb`.`pagos`
-- -----------------------------------------------------
CREATE TABLE pagos (
  idPago INT(10) NOT NULL,
  fechahora DATE NULL,
  monto DOUBLE NULL,
  usuarioid INT(10) NOT NULL,
  PRIMARY KEY (idPago),
    FOREIGN KEY (usuarioid)
    REFERENCES usuarios (idusuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`licencias`
-- -----------------------------------------------------
CREATE TABLE licencias (
  idLicencia INT(10) NOT NULL,
  fechaInicio DATE NULL,
  fechaFin DATE NULL,
  tipo VARCHAR(4) NULL,
  idPago INT(10) NOT NULL,
  PRIMARY KEY (idLicencia),
    FOREIGN KEY (idPago)
    REFERENCES pagos(idPago)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`dispositivos`
-- -----------------------------------------------------
CREATE TABLE dispositivos (
  idDispositivo INT(10) NOT NULL,
  tipoDispositivo VARCHAR(10) NULL,
  modelo VARCHAR(16) NULL,
  nombreProducto VARCHAR(20) NULL,
  idUsuario INT(10) NOT NULL,
  numeroSerie VARCHAR(20) NOT NULL,
  IMEI VARCHAR(18) NOT NULL,
  PRIMARY KEY (idDispositivo),
    FOREIGN KEY (idUsuario)
    REFERENCES usuarios (idUsuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `mydb`.`hardwares`
-- -----------------------------------------------------
CREATE TABLE hardwares (
  idHardware INT(10) NOT NULL,
  cantidadalmacenamiento DOUBLE NULL,
  ram DOUBLE NULL,
  cpuDescripcion DOUBLE NULL,
  pantalla DOUBLE NULL,
  idDispositivo INT(10) NOT NULL,
  PRIMARY KEY (idhardware),
    FOREIGN KEY (idDispositivo)
    REFERENCES dispositivos (idDispositivo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`operadoras`
-- -----------------------------------------------------
CREATE TABLE operadoras (
  idOperadora INT(10) NOT NULL,
  nombreoperadora VARCHAR(15) NULL,
  ciudad VARCHAR(15) NULL,
  numtelefono INT(10) NULL,
  codigoregion VARCHAR(3) NULL,
  idDispositivo INT(10) NOT NULL,
  lada VARCHAR(5) NULL,
  PRIMARY KEY (idOperadora),
    FOREIGN KEY (idDispositivo)
    REFERENCES dispositivos (idDispositivo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `mydb`.`softwares`
-- -----------------------------------------------------
CREATE TABLE softwares (
  idSoftware INT(10) NOT NULL,
  numeroAplicaciones INT NULL,
  soversion VARCHAR(10) NULL,
  nombreVersion VARCHAR(10) NULL,
  customrom TINYINT(1) NULL,
  root boolean NULL,
  idDispositivo INT(10) NOT NULL,
  PRIMARY KEY (idSoftware),
    FOREIGN KEY (idDispositivo)
    REFERENCES dispositivos (idDispositivo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`acciones`
-- -----------------------------------------------------
CREATE TABLE acciones (
  idAcciones INT NOT NULL,
  tipoaccion VARCHAR(45) NULL,
  horain TIME NULL,
  horafin TIME NULL,
  fechahora DATE NULL,
  tiempo INT NULL,
  idDispositivo INT(10) NOT NULL,
  PRIMARY KEY (idAcciones),
    FOREIGN KEY (idDispositivo)
    REFERENCES dispositivos (idDispositivo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


  INSERT INTO usuarios (idUsuario,nombre,apellidoP,apellidoM,ciudad,genero,email,fechaNacimiento, password) VALUES
(1234567890,'Arturo','Aguilar','Alvarez','Playa del Carmen','H','gpkharvi@gmail.com','1996-10-30', 'password');
