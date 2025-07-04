-- 1. Product category with the highest sales
SELECT Product_Category, SUM(Sales) as TotalSales
FROM [KMS Sql Case Study] 
GROUP BY Product_Category
ORDER BY TotalSales DESC
OFFSET 0 ROWS FETCH NEXT 1 ROW ONLY;

--ANS: Technology -- 5984248.17547321

-- 2. Top 3 and Bottom 3 regions by sales
-- Top 3
SELECT TOP 3 Region, SUM(Sales) as TotalSales
FROM [KMS Sql Case Study]
GROUP BY Region
ORDER BY TotalSales DESC;

-- ANS: West	3597549.269871
--Ontario	3063212.47638369
--Prarie	2837304.60503292

-- Bottom 3
SELECT TOP 3 Region, SUM(Sales) as TotalSales
FROM [KMS Sql Case Study]
GROUP BY Region
ORDER BY TotalSales ASC;

-- ANS: Nunavut	116376.48383522
-- Northwest Territories	800847.330903053
-- Yukon	975867.375723362

-- 3. Total sales of appliances in Ontario
SELECT SUM(Sales) as TotalApplianceSales
FROM [KMS Sql Case Study]
WHERE Product_Category = 'Office Supplies' AND Product_Sub_Category = 'Appliances' AND Province = 'Ontario'

-- ANS: 202346.839630127

-- 4. Bottom 10 customers by sales (for revenue increase advice)
SELECT TOP 10 Customer_Name, SUM(Sales) as TotalSales
FROM [KMS Sql Case Study]
GROUP BY Customer_Name
ORDER BY TotalSales ASC;

-- ANS: Jeremy Farry	85.7200021743774
-- Natalie DeCherney	125.900001525879
-- Nicole Fjeld	153.030006408691
-- Katrina Edelman	180.760005950928
-- Dorothy Dickinson	198.080001831055
-- Christine Kargatis	293.2200050354
-- Eric Murdock	343.32799911499
-- Chris McAfee	350.180004119873
-- Rick Huthwaite	415.819980621338
-- Mark Hamilton	450.990005493164

-- 5. Shipping method with the highest shipping cost
SELECT Ship_Mode, SUM(Shipping_Cost) as TotalShippingCost
FROM [KMS Sql Case Study]
GROUP BY Ship_Mode
ORDER BY TotalShippingCost DESC
OFFSET 0 ROWS FETCH NEXT 1 ROW ONLY;

-- ANS: Delivery Truck	51971.9397373199

-- 6. Most valuable customers (top 5 by sales) and their typical purchases
SELECT TOP 5 
    Customer_Name, 
    SUM(Sales) as TotalSales,
    STRING_AGG(Product_Category, ', ') as TypicalProductCategories,
    STRING_AGG(Product_Sub_Category, ', ') as TypicalProductSubCategories
FROM [KMS Sql Case Study]
GROUP BY Customer_Name
ORDER BY TotalSales DESC;

-- ANS: Emily Phan	117124.435264587	Technology, Furniture, Office Supplies, Office Supplies, Technology, Technology, Office Supplies, Office Supplies, Office Supplies, Technology	Telephones and Communication, Bookcases, Appliances, Storage & Organization, Office Machines, Telephones and Communication, Pens & Art Supplies, Binders and Binder Accessories, Binders and Binder Accessories, Office Machines
-- Deborah Brumfield	97433.1346206665	Office Supplies, Office Supplies, Office Supplies, Office Supplies, Furniture, Office Supplies, Technology, Office Supplies, Furniture, Technology, Technology, Technology, Technology, Office Supplies, Furniture, Technology, Office Supplies, Technology, Technology, Furniture	Appliances, Pens & Art Supplies, Scissors, Rulers and Trimmers, Storage & Organization, Chairs & Chairmats, Labels, Telephones and Communication, Storage & Organization, Office Furnishings, Copiers and Fax, Telephones and Communication, Telephones and Communication, Computer Peripherals, Binders and Binder Accessories, Chairs & Chairmats, Office Machines, Storage & Organization, Computer Peripherals, Telephones and Communication, Chairs & Chairmats
--Roy Skaria	92542.1531906128	Office Supplies, Furniture, Office Supplies, Office Supplies, Office Supplies, Office Supplies, Furniture, Furniture, Office Supplies, Office Supplies, Technology, Furniture, Office Supplies, Furniture, Office Supplies, Office Supplies, Furniture, Furniture, Technology, Office Supplies, Technology, Office Supplies, Technology, Technology, Technology, Furniture	Binders and Binder Accessories, Bookcases, Pens & Art Supplies, Pens & Art Supplies, Paper, Appliances, Office Furnishings, Bookcases, Storage & Organization, Pens & Art Supplies, Copiers and Fax, Tables, Binders and Binder Accessories, Bookcases, Pens & Art Supplies, Binders and Binder Accessories, Bookcases, Office Furnishings, Telephones and Communication, Paper, Computer Peripherals, Paper, Copiers and Fax, Computer Peripherals, Telephones and Communication, Office Furnishings
-- Sylvia Foulston	88875.7581214905	Office Supplies, Office Supplies, Technology, Furniture, Office Supplies, Office Supplies, Office Supplies, Technology, Furniture, Technology, Furniture, Office Supplies, Furniture, Furniture, Technology, Furniture, Office Supplies, Furniture, Furniture, Furniture, Office Supplies, Office Supplies, Technology, Furniture	Envelopes, Appliances, Telephones and Communication, Tables, Binders and Binder Accessories, Rubber Bands, Binders and Binder Accessories, Computer Peripherals, Office Furnishings, Telephones and Communication, Chairs & Chairmats, Labels, Chairs & Chairmats, Chairs & Chairmats, Office Machines, Chairs & Chairmats, Appliances, Bookcases, Tables, Chairs & Chairmats, Appliances, Binders and Binder Accessories, Telephones and Communication, Chairs & Chairmats
-- Grant Carroll	88417.0006103516	Office Supplies, Office Supplies, Office Supplies, Office Supplies, Technology, Office Supplies, Office Supplies, Furniture, Office Supplies, Office Supplies, Furniture, Office Supplies, Office Supplies, Office Supplies, Office Supplies, Technology, Office Supplies, Furniture, Furniture, Technology, Technology, Technology, Furniture, Technology, Office Supplies, Technology, Office Supplies	Binders and Binder Accessories, Labels, Paper, Pens & Art Supplies, Telephones and Communication, Binders and Binder Accessories, Binders and Binder Accessories, Bookcases, Binders and Binder Accessories, Appliances, Chairs & Chairmats, Paper, Paper, Pens & Art Supplies, Storage & Organization, Telephones and Communication, Paper, Bookcases, Chairs & Chairmats, Computer Peripherals, Computer Peripherals, Computer Peripherals, Office Furnishings, Telephones and Communication, Paper, Computer Peripherals, Pens & Art Supplies

-- 7. Small business customer with the highest sales
SELECT TOP 1 Customer_Name, SUM(Sales) as TotalSales
FROM [KMS Sql Case Study]
WHERE Customer_Segment = 'Small Business'
GROUP BY Customer_Name
ORDER BY TotalSales DESC;

-- ANS: Dennis Kane	75967.5932159424

-- 8. Corporate customer with the most orders (2009-2012)
SELECT TOP 1 Customer_Name, COUNT(DISTINCT Order_ID) as OrderCount
FROM [KMS Sql Case Study]
WHERE Customer_Segment = 'Corporate'
AND YEAR(Order_Date) BETWEEN 2009 AND 2012
GROUP BY Customer_Name
ORDER BY OrderCount DESC;

-- ANS: Adam Hart	18

-- 9. Most profitable consumer customer
SELECT TOP 1 Customer_Name, SUM(Profit) as TotalProfit
FROM [KMS Sql Case Study]
WHERE Customer_Segment = 'Consumer'
GROUP BY Customer_Name
ORDER BY TotalProfit DESC;

-- ANS: Emily Phan	34005.4392166138

-- 10. Customers with negative profit (assumed as returns) and their segment
SELECT DISTINCT Customer_Name, Customer_Segment
FROM [KMS Sql Case Study]
WHERE Profit < 0;

-- 11. Analysis of shipping cost appropriateness based on Order Priority
SELECT 
    Order_Priority, 
    Ship_Mode, 
    COUNT(*) as OrderCount, 
    SUM(Shipping_Cost) as TotalShippingCost,
    AVG(Shipping_Cost) as AvgShippingCost
FROM [KMS Sql Case Study]
GROUP BY Order_Priority, Ship_Mode
ORDER BY Order_Priority, TotalShippingCost DESC;

-- ANS: Critical	Delivery Truck	228	10783.8199481964	47.2974559131422
-- Critical	Regular Air	1180	8586.75996172428	7.27691522180024
-- Critical	Express Air	200	1742.09998804331	8.71049994021654
-- High	Delivery Truck	248	11206.8799371719	45.1890320047255
-- High	Regular Air	1308	10005.0099598169	7.64909018334628
-- High	Express Air	212	1453.5299910903	6.85627354287876
-- Low	Delivery Truck	250	11131.6099338531	44.5264397354126
-- Low	Regular Air	1280	10263.619956553	8.01845309105702
-- Low	Express Air	190	1551.62999778986	8.16647367257821
-- Medium	Delivery Truck	205	9461.61997509003	46.154243780927
-- Medium	Regular Air	1225	9418.71996569633	7.68875099240517
-- Medium	Express Air	201	1633.58999282122	8.12731339712048
-- Not Specified	Regular Air	1277	9734.07996362448	7.62261547660492
-- Not Specified	Delivery Truck	215	9388.00994300842	43.6651625256206
-- Not Specified	Express Air	180	1470.05999219418	8.16699995663431