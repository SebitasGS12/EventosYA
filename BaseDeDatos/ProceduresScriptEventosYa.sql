
DELIMITER $$
USE `eventosya`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_validaAcceso`(IN correo varchar(100), IN clave varchar(100))
BEGIN
    SELECT * FROM usuarios u
    WHERE  u.contraseñaUsu = clave and u.correoUsu = correo ;
END$$

DELIMITER ;
