/*
 * 引数を取得する単純なプログラム
 */
use sakila;
DROP PROCEDURE IF EXISTS `proc_arg_sample`;

DELIMITER $$
CREATE PROCEDURE proc_arg_sample(IN in_input1 INT, OUT out_param1 INT, OUT out_param2 VARCHAR(8))
COMMENT 'TEST proc_arg_sample'
BEGIN
  SET out_param1 = in_input1;
  SET out_param2 = 'hello';
END;
$$
DELIMITER ;

CALL proc_arg_sample(999, @param1_out, @param2_out);
SELECT @param1_out, @param2_out;

DROP PROCEDURE `proc_arg_sample`;
