/*
 * 引数を取得する単純なプログラム
 */
use sakila;
DROP PROCEDURE IF EXISTS `proc_set_value`;

DELIMITER $$
CREATE PROCEDURE proc_set_value()
COMMENT 'TEST proc_set_value'
BEGIN
  -- @idで設定しています
  SELECT @id:=city_id FROM city WHERE city LIKE "Kam%";

  -- 複数レコードが上記で抽出されると最後のidが入ることになります。
  SELECT @id;
END;
$$
DELIMITER ;

CALL proc_set_value();

DROP PROCEDURE `proc_set_value`;
