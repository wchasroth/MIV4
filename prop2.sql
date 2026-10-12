/*
| id    | org  | office     | district | subdist | seatnum | seatmax | termlen | termcycle | is_open | source | termlen_q |
+-------+------+------------+----------+---------+---------+---------+---------+-----------+---------+--------+-----------+
| 17425 | cnty | prop       | 1        |       0 |       1 |       0 |       0 |      2026 |       0 |        |         0 |
| 17436 | cnty | prop-state | 81       |       0 |       1 |       0 |       0 |      2026 |       0 |        |         0 |
| 17438 | cnty | prop-state | 39       |       0 |       1 |       0 |       0 |      2026 |       0 |        |         0 |
| 17439 | cnty | prop-state | 41       |       0 |       1 |       0 |       0 |      2026 |       0 |        |         0 |
| 17440 | cnty | prop-state | 61       |       0 |       1 |       0 |       0 |      2026 |       0 |        |         0 |
| 17441 | cnty | prop-state | 70       |       0 |       1 |       0 |       0 |      2026 |       0 |        |         0 |
| 17442 | city | prop       | 14320    |       0 |       1 |       0 |       0 |      2026 |       0 |        |         0 |
| 17443 | city | prop       | 14320    |       0 |       2 |       0 |       0 |      2026 |       0 |        |         0 |
| 17444 | city | prop       | 14320    |       0 |       3 |       0 |       0 |      2026 |       0 |        |         0 |
| 17445 | city | prop       | 14320    |       0 |       4 |       0 |       0 |      2026 |       0 |        |         0 |
| 17447 | cnty | prop       | 50       |       0 |       1 |       0 |       0 |      2026 |       0 |        |         0 |
| 17448 | cnty | prop       | 50       |       0 |       2 |       0 |       0 |      2026 |       0 |        |         0 |
| 17449 | city | prop       | 89140    |       0 |       1 |       0 |       0 |      2026 |       0 |        |         0 |
| 17450 | cnty | prop-state | 13       |       0 |       1 |       0 |       0 |      2026 |       0 |        |         0 |
| 17462 | cnty | prop       | 33       |       0 |       1 |       0 |       0 |      2026 |       0 |        |         0 |
| 17463 | cnty | prop-state | 47       |       0 |       1 |       0 |       0 |      2026 |       0 |        |         0 |
| 17464 | cnty | prop-state | 23       |       0 |       1 |       0 |       0 |      2026 |       0 |        |         0 |
| 17465 | cnty | prop-state | 74       |       0 |       1 |       0 |       0 |      2026 |       0 |        |         0 |
+-------+------+------------+----------+---------+---------+---------+---------+-----------+---------+--------+-----------+

mysql> select id, seat_id, name from v4candidates where name like '2%';
+------+---------+--------------------------------+
| id   | seat_id | name                           |
+------+---------+--------------------------------+
| 1127 |   17424 | 2 - YES: Money out of Politics |
| 1425 |   17436 | 2 - YES: Money out of Politics |
| 1428 |   17438 | 2 - YES: Money out of Politics |
| 1429 |   17439 | 2 - YES: Money out of politics |
| 1430 |   17440 | 2 - YES: Money out of politics |
| 1431 |   17441 | 2 - YES: Money out of politics |
| 1583 |   17462 | 2 - YES: Money out of Politics |
| 1584 |   17463 | 2 - YES: Money out of Politics |
| 1611 |   17464 | 2 - YES: Money out of Politics |
| 1612 |   17465 | 2 - YES: Money out of Politics |
*/


SELECT s.id, y.name, s.office, c.name, c.endorsed, c.reviewed
  FROM      s4counties   AS y
  LEFT JOIN v4seats      AS s ON (s.district = y.id)
  LEFT JOIN v4candidates AS c ON (c.seat_id  = s.id)
 WHERE s.office LIKE '%prop%'
   AND c.name LIKE '2%'
 ORDER BY y.name


