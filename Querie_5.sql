SELECT o.ORD_ID, o.ORD_AMOUNT, o.ORD_DATE, p.PRO_NAME
FROM order_table o
JOIN supplier_pricing sp ON o.PRICING_ID = sp.PRICING_ID
JOIN product p ON sp.PRO_ID = p.PRO_ID
WHERE o.CUS_ID = 2;
