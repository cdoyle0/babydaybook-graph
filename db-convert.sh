#!/bin/bash
CONVERT_DIR=${BE_CONVERT:-convert}
DEFAULT_CONVERT_FILE=$(date -j -v-1d "+BabyDaybook_%Y%m%d.db")
CONVERT_FILE=${1:-$CONVERT_DIR/$DEFAULT_CONVERT_FILE}
DATA_DIR=${BE_DATA_DIR:-data}
DATA_FILE=$(date "+export-%Y-%m-%d.%H.%M.%S.csv")

sqlite3 $CONVERT_FILE <<!
.headers on
.mode csv
.output $DATA_DIR/$DATA_FILE

SELECT
	_id AS id,
	type,
	datetime(start_millis/1000, 'unixepoch') AS start,
	datetime(end_millis/1000, 'unixepoch') AS end,
	(end_millis - start_millis)/1000 AS duration,
	notes,
	side,
	volume,
	temperature,
	pee,
	poo,
	hair_wash
FROM daily_actions
ORDER BY start_millis;
!
