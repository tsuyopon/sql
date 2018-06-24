/*
 * 単純なカーソルのサンプル(LOOPを利用する場合)
 *
 */
use sakila;
DROP PROCEDURE IF EXISTS `proc_curdemo2`;

DELIMITER $$
CREATE PROCEDURE proc_curdemo2()
COMMENT 'TEST proc_curdemo2'
BEGIN

  -- カーソル変数、カーソル定義、カーソルハンドラの順番で記述しないとエラーになる。
  DECLARE l_get_city_id INT;
  DECLARE l_get_city VARCHAR(40);

  DECLARE cur_sample CURSOR FOR SELECT city_id, city FROM city WHERE country_id=82;

  -- EXITハンドラをセットするとLOOP..ENDで記述することができる。
  DECLARE EXIT HANDLER FOR SQLSTATE '02000' BEGIN END;

  OPEN cur_sample;

  -- カーソルごとに処理を行う。
  loop_label: LOOP
    FETCH cur_sample INTO l_get_city_id, l_get_city;
    SELECT l_get_city_id, l_get_city;
  END LOOP;

  CLOSE cur_sample;

END;
$$
DELIMITER ;

CALL proc_curdemo2();

DROP PROCEDURE `proc_curdemo2`;
