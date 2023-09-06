SELECT c."login",
       COUNT(o."id") AS "колличество заказов"
FROM "Couriers" AS c
JOIN "Orders" AS o ON c."id" = o."courierId"
WHERE o."inDelivery" = true
GROUP BY c."login";

--####################################################################

SELECT "track",
       CASE
           WHEN finished THEN 2
           WHEN cancelled THEN -1
           WHEN "inDelivery" THEN 1
           ELSE 0
       END AS "statusValue"
FROM "Orders";
-- ТАК И НЕ ПОНЯЛ ЧТО С СИНТАКСИСОМ НЕ ТАК. НИЖЕ КОПИЯ ИЗ ТЕРМИНАЛА, ЗАПРОС РАБОТАЕТ КОРРЕКТНО.
--####################################################################

scooter_rent=# SELECT "track",
scooter_rent-#        CASE
scooter_rent-#            WHEN finished THEN 2
scooter_rent-#            WHEN cancelled THEN -1
scooter_rent-#            WHEN "inDelivery" THEN 1
scooter_rent-#            ELSE 0
scooter_rent-#        END AS "statusValue"
scooter_rent-# FROM "Orders";
 track | statusValue
-------+-------------
(0 rows)

scooter_rent=# SELECT "track",
       CASE
           WHEN finished THEN 2
           WHEN cancelled THEN -1
           WHEN "inDelivery" THEN 1
           ELSE 0
       END AS "statusValue"
FROM "Orders";
 track  | statusValue
--------+-------------
 470915 |           0
 432428 |           0
 676190 |           0
  46671 |           0
 365803 |           0
 316191 |           0
 365160 |           0
(7 rows)

scooter_rent=# SELECT "track",
       CASE
           WHEN finished THEN 2
           WHEN cancelled THEN -1
           WHEN "inDelivery" THEN 1
           ELSE 0
       END AS "statusValue"
FROM "Orders";
 track  | statusValue
--------+-------------
 470915 |           0
 432428 |           0
 676190 |           0
  46671 |           0
 316191 |           0
 365160 |           0
 365803 |           1
 365803 |           1
(8 rows)

scooter_rent=#
