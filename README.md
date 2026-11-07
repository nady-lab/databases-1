# <img src="assets/folder.png" width="32" alt=""> databases 1

SQL labs from my databases module at TU Dublin, written for PostgreSQL. it starts with a food delivery app to get the basics down and moves on to a football players database that i query with joins, set operations, aggregates and subqueries. new labs get added as the module goes on.

## <img src="assets/breakdown.png" width="24" alt=""> structure

each lab is a single `.sql` file in its own folder, like `lab5/lab5.sql`. lab 2 also has the diagram i drew and a screenshot from DBeaver.

## <img src="assets/gears.png" width="24" alt=""> running the scripts

open a script in pgAdmin or DBeaver and run it, or use `psql`:

```bash
psql -d your_database -f lab5/lab5.sql
```

a couple of things to know first:

- **lab 2** puts its tables in a schema called `FoodApp`, which the script doesn't create, so run `CREATE SCHEMA "FoodApp";` before it.
- **labs 3 to 5** start with `DROP TABLE IF EXISTS`, so running one will wipe the tables and anything loaded into them. the repo only has the table definitions and queries, not the player data, so the `SELECT` queries return rows only once the data has been loaded back in.
- **lab 8** only has queries. it expects the football tables from lab 5 to exist and have data loaded.

## <img src="assets/tools.png" width="24" alt=""> tools

PostgreSQL, pgAdmin, DBeaver

## <img src="assets/heart.png" width="24" alt=""> credits

feel free to use or learn from any of this code. if you do, a link back to this repo or a mention of [@nady-lab](https://github.com/nady-lab) would be really appreciated!
