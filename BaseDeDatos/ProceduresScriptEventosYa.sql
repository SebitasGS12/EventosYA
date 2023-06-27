
DELIMITER $$
USE `eventosya`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_validaAcceso`(IN correo varchar(100), IN clave varchar(100))
BEGIN
    SELECT * FROM usuarios u
    WHERE  u.contraseñaUsu = clave and u.correoUsu = correo ;
END$$

DELIMITER ;


USE `eventosya`;
DROP procedure IF EXISTS `usp_buscarEvento`;

DELIMITER $$
USE `eventosya`$$
CREATE PROCEDURE `usp_buscarEvento` (in texto varchar(100) )
BEGIN
	select * from evento
    where nombreEvento like CONCAT("%",texto,"%") or
    idEvento like CONCAT("%",texto,"%") or
	descripcionEvento like CONCAT("%",texto,"%") or
    ubicacionEvento like CONCAT("%",texto,"%") ;


END$$

DELIMITER ;