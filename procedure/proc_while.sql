/*
 * WHILE .. END WHILE を使った繰り返しサンプル
 */

-- sakilaとはあまり関係ないですが...
use sakila;
DROP PROCEDURE IF EXISTS `proc_while`;

DELIMITER $$
CREATE PROCEDURE proc_while()
COMMENT 'TEST proc_while'
BEGIN
  DECLARE x  INT;
  DECLARE str  VARCHAR(255);

  SET x = 1;
  SET str =  '';

  -- ラベルは付与しなくても良い。その場合にはEND WHILEの後にラベル指定は不要です。
  while_label: WHILE x  <= 5 DO
    SET  str = CONCAT(str,x,',');
    SET  x = x + 1; 
  END WHILE while_label;

  SELECT str;

END;
$$
DELIMITER ;

CALL proc_while();

DROP PROCEDURE `proc_while`;
