/*
 * ストアドプロシージャ中でIFを使う方法などについて
 */

use sakila;
DROP PROCEDURE IF EXISTS `proc_if_else_statement`;

DELIMITER $$
CREATE PROCEDURE proc_if_else_statement()
COMMENT 'TEST proc_if_else_statement'
BEGIN

  -- 宣言は最初に置かないとエラーになる
  DECLARE test1    INT;
  DECLARE str1     VARCHAR(255);
  DECLARE str2     VARCHAR(255);

  SET test1 = 101;

  -- Result1: 値判定
  IF test1 > 100 THEN
    SELECT "OVER 100" AS "result1";
  ELSEIF test1 > 10 THEN
    SELECT "OVER 10" AS "result1";
  ELSE
    SELECT "OTHERS" AS "result1";
  END IF;

  -- Result2: 値マッチ (alpha(アルファベット)だけで構成されているかどうかを判定)
  SET str1 = "hoge100";
  IF str1 REGEXP '^[[:alpha:]]+$' THEN
    SELECT "ONLY alpha" AS "result";
  ELSE 
    SELECT "NOT alpha" AS "result";     -- 数字が含まれるのでこちらになる
  END IF;

  -- Result3: 値マッチ part2
  SET str2 = "hoge100.co.jp";
  IF str2 REGEXP '^([[:alnum:]]|\\.)+$' THEN
    SELECT "is domain" AS "result";    -- alnum(アルファベット+数字)またはドットなのでこちらに入る
  ELSE 
    SELECT "is NOT domain" AS "result";  
  END IF;

END;
$$
DELIMITER ;

CALL proc_if_else_statement();

DROP PROCEDURE `proc_if_else_statement`;
