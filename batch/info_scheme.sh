#!/bin/sh
# シェルスクリプトとして実行してください。引数にはスキーマを指定します。
# $ ./info.sh sakila

SCHEMA=$1

sql="SELECT table_name, column_name FROM information_schema.columns WHERE table_schema = '$SCHEMA' LIMIT 3;"
mysql -uroot information_schema <<EOF

\! echo "### STEP1: Execute from inside shellscript";
$sql

\! echo ""; 
\! echo "### STEP2: Execute from outside file using SOURCE COMMAND";
START TRANSACTION;
SOURCE info_scheme.sh.sql
COMMIT;

ROLLBACK;
-- COMMIT;

EOF
