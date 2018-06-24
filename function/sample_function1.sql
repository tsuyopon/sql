/*
 * FUNCTIONのサンプルプログラム
 */
use sakila 

DROP FUNCTION IF EXISTS sample_function1;

-- DETERMINISTICは入力値によって出力値が決定する場合に付与します。(ただ、これは自己申告なので毎回値が変わるものでもDETERMINISTICとしてもエラーにならない)
-- 関数はストアドプロシージャと異なり戻り値があります
DELIMITER $$
CREATE FUNCTION sample_function1 ( add_value INT ) RETURNS INT DETERMINISTIC
COMMENT 'TEST FUNCTION sample_function1'
BEGIN

   DECLARE sum INT;

   SET sum = 0;

   label1: REPEAT
     SET sum = sum + add_value;
   UNTIL sum >= 4000 
   END REPEAT label1;

   RETURN sum;

END;
$$

DELIMITER ;

-- 関数だと呼び出しはCALLではなくSELECTです。
SELECT sample_function1(3000);
SELECT sample_function1(8000);

DROP FUNCTION sample_function1;
