/*
 * LOOP, ITERATE, LEAVE を使った繰り返しサンプル
 * LEAVEでラベルを脱出できることを確認しておくこと
 */

-- sakilaとはあまり関係ないですが...
use sakila;
DROP PROCEDURE IF EXISTS `proc_loop_leave_iterate`;

DELIMITER $$
CREATE PROCEDURE proc_loop_leave_iterate()
COMMENT 'TEST proc_loop_leave_iterate'
BEGIN

  DECLARE x    INT;
  DECLARE str  VARCHAR(255);
         
  SET x = 1;
  SET str =  '';
         
  -- x=1からx=10までループして、偶数の場合だけ結果を結合している。
  loop_label: LOOP

    IF  x > 10 THEN 
      -- ラベルを指定して、ラベルスコープからの脱出ができる
      LEAVE loop_label;
    END IF;
               
    SET  x = x + 1;
    IF  (x mod 2) THEN
      -- C++, PHPなどのcontinueと等価
      ITERATE loop_label;
    ELSE
      SET str = CONCAT(str,x,',');
    END IF;
  END LOOP loop_label;    

  SELECT str;

END;
$$
DELIMITER ;

CALL proc_loop_leave_iterate();

DROP PROCEDURE `proc_loop_leave_iterate`;
