/*
 * REPEAT .. UNTIL .. END REPEAT を使った繰り返しサンプル
 */

-- sakilaとはあまり関係ないですが...
use sakila;
DROP PROCEDURE IF EXISTS `proc_repeat`;

DELIMITER $$
CREATE PROCEDURE proc_repeat()
COMMENT 'TEST proc_repeat'
BEGIN

  DECLARE x INT;
  DECLARE str VARCHAR(255);
        
  SET x = 1;
  SET str =  '';
        
   -- UNTILの条件までREPEATを繰り返す。
   -- REPEATのラベルは指定しても指定しなくても良い。指定しない場合にはEND REPEATの後にラベル指定は不要。
   repeat_label: REPEAT
     SET  str = CONCAT(str,x,',');
     SET  x = x + 1; 
   UNTIL x  > 5
   END REPEAT repeat_label;
 
   SELECT str;

END;
$$
DELIMITER ;

CALL proc_repeat();

DROP PROCEDURE `proc_repeat`;
