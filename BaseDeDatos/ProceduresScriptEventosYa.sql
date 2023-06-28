
DELIMITER $$
USE `eventosya`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_validaAcceso`(IN correo varchar(100), IN clave varchar(100))
BEGIN
    SELECT * FROM usuarios u
    WHERE  u.contraseñaUsu = clave and u.correoUsu = correo ;
END$$

DELIMITER ;

USE `eventosya`;
DROP PROCEDURE IF EXISTS `usp_buscarEvento`;

DELIMITER $$
USE `eventosya`$$
CREATE PROCEDURE `usp_buscarEvento` (IN texto VARCHAR(100))
BEGIN
    SELECT o.idOrganizador,o.idUsuario,o.idEvento FROM evento e
    JOIN organizador o ON o.idEvento = e.idEvento
    WHERE e.nombreEvento LIKE CONCAT("%", texto, "%")
        OR e.idEvento LIKE CONCAT("%", texto, "%")
        OR e.descripcionEvento LIKE CONCAT("%", texto, "%")
        OR e.ubicacionEvento LIKE CONCAT("%", texto, "%");
END$$

DELIMITER ;

