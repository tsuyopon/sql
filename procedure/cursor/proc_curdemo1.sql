/*
 * 単純なカーソルのサンプル(WHILE..ENDステートメント)
 *
 */
use sakila;
DROP PROCEDURE IF EXISTS `proc_curdemo1`;

DELIMITER $$
CREATE PROCEDURE proc_curdemo1()
COMMENT 'TEST proc_curdemo1'
BEGIN

  -- カーソル変数、カーソル定義、カーソルハンドラの順番で記述しないとエラーになる。
  DECLARE l_continue INT DEFAULT 1;
  DECLARE l_get_city_id INT;
  DECLARE l_get_city VARCHAR(40);

  DECLARE cur_sample CURSOR FOR SELECT city_id, city FROM city WHERE country_id=82;

  -- 02000はカーソルでループして処理する対象レコードが存在しなくなったらという意味。その時にl_continueは0にセットされる。
  DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET l_continue = 0;

  OPEN cur_sample;

  -- カーソルごとに処理を行う。
  WHILE l_continue DO
    FETCH cur_sample INTO l_get_city_id, l_get_city;
    IF l_continue THEN
      SELECT l_get_city_id, l_get_city;
    END IF;
  END WHILE;

  CLOSE cur_sample;

END;
$$
DELIMITER ;

CALL proc_curdemo1();

DROP PROCEDURE `proc_curdemo1`;
