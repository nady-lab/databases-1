# databases 1

SQL labs from my first databases module at TU Dublin, written for PostgreSQL. it starts with designing a food delivery app from scratch and moves on to a football players database that i query with joins and set operations.

## what each lab covers

| lab | what's in it |
|-----|--------------|
| 2 | designing a food delivery app (`FoodApp`): customers, restaurants, menu items, orders and order items, with primary and foreign keys. the diagram i drew is in the folder too, plus a screenshot from DBeaver |
| 3 | building a football database (clubs, players, player attributes, player contracts) and adding a column with a default value and a `CHECK` constraint using `ALTER TABLE` |
| 4 | joining tables with `JOIN ... USING`, sorting with `ORDER BY`, top 10 lists with `LIMIT`, and filtering with `WHERE` |
| 5 | set operations: `UNION`, `INTERSECT` and `EXCEPT`, e.g. players with no contract, or players under 20 who do have one |

## running the scripts

each lab is a single `.sql` file in its own folder. open one in pgAdmin or DBeaver and run it, or use `psql`:

```bash
psql -d your_database -f lab5/lab5.sql
```

a couple of things to know first:

**lab 2** puts its tables in a schema called `FoodApp`, which the script doesn't create, so run `CREATE SCHEMA "FoodApp";` before it.<br/>
**labs 3 to 5** start with `DROP TABLE IF EXISTS`, so running one will wipe the tables and anything loaded into them. the repo only has the table definitions and queries, not the player data, so the `SELECT` queries return rows only once the data has been loaded back in.

## folders

```
lab2/   lab2.sql, the diagram + a DBeaver screenshot
lab3/   lab3.sql
lab4/   lab4.sql
lab5/   lab5.sql
```
