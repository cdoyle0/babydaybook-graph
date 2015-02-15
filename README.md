# babydaybook-graph
Create graphs for https://play.google.com/store/apps/details?id=com.drillyapps.babydaybook

# Convert the backup db file to data files for the graphing. The converted fill will be
# Saved in the data directory. This is designed to work with BSD shell utilities (OS X).

* Make sure sqlite3 is in your path.
* Save the backup file to the convert directory.

Invoke using `db-convert.sh convert/BabyDaybook_exportdate.db`.