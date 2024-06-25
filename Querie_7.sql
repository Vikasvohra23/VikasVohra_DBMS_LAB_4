SELECT c.CAT_ID, c.CAT_NAME, p.PRO_NAME, sp.SUPP_PRICE
FROM category c
JOIN product p ON c.CAT_ID = p.CAT_ID
JOIN supplier_pricing sp ON p.PRO_ID = sp.PRO_ID
WHERE sp.SUPP_PRICE = (
    SELECT MIN(sp2.SUPP_PRICE)
    FROM supplier_pricing sp2
    JOIN product p2 ON sp2.PRO_ID = p2.PRO_ID
    WHERE p2.CAT_ID = c.CAT_ID
);
