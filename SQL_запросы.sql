SELECT c."login",
       COUNT(o."id") AS "колличество заказов"
FROM "Couriers" AS c
JOIN "Orders" AS o ON c."id" = o."courierId"
WHERE o."inDelivery" = true
GROUP BY c."login";

--####################################################################

SELECT finished,
       cancelled,
       "inDelivery",
       CASE
           WHEN finished THEN 2
           WHEN cancelled THEN -1
           WHEN "inDelivery" THEN 1
           ELSE 0
       END AS "statusValue"
FROM "Orders";

--####################################################################
