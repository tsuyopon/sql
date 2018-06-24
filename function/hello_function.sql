/*
 * FUNCTIONのサンプルプログラム
 */
use sakila 

DROP FUNCTION IF EXISTS hello_function;

-- DETERMINISTICは入力値によって出力値が決定する場合に付与します。(ただ、これは自己申告なので毎回値が変わるものでもDETERMINISTICとしてもエラーにならない)
-- 関数はストアドプロシージャと異なり、戻り値があります
DELIMITER $$
CREATE FUNCTION hello_function() RETURNS VARCHAR(12) DETERMINISTIC
COMMENT 'TEST FUNCTION hello_function'
BEGIN
  RETURN 'hello, world';
END;
$$

DELIMITER ;

-- 関数だと呼び出しはCALLではなくSELECTです。
SELECT hello_function();

DROP FUNCTION hello_function;
