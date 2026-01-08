          -- SELECTING COLUMNS --
-- SELECT * FROM cars;
-- SELECT brand, model, price FROM cars;


          -- ADDING CONDITIONS --
-- SELECT brand, model, price FROM cars
--   WHERE color = 'black';

-- SELECT brand, model, condition, price FROM cars 
--   WHERE condition = '0';


          -- NUMERICAL FILTERING --
-- SELECT brand, condition, price FROM cars
--   WHERE condition > 3;

-- SELECT brand, model, condition, price FROM cars 
--   WHERE price < 50000

-- SELECT brand, model, price, year FROM cars 
--   WHERE year != 1965;

-- SELECT brand, model, price, color FROM cars
--   WHERE color <> 'yellow';

-- SELECT brand, model, color, year FROM cars
--   WHERE model LIKE 'DB_';


          -- COMBINING CONDITIONS --
-- SELECT brand, model, color, year FROM cars
--   WHERE color NOT LIKE '%green%'
--   AND model LIKE 'DB_'
--   AND year > 1964;

-- SELECT brand, model, year, condition, price FROM cars
--   WHERE condition >= 3
--   AND year < 1970
--   AND price < 100000;

-- SELECT brand, model, year, price FROM cars
--   WHERE year > 1979 AND year < 1990;

-- SELECT brand, model, year, price FROM cars
--   WHERE year BETWEEN 1980 AND 1989;

-- SELECT brand, model, color, price, condition FROM cars
--   WHERE price BETWEEN 20000 AND 60000
--   AND condition BETWEEN 1 AND 3
--   AND color LIKE '%red%';


          -- COMBINE BUT SELECT CONDITIONS --
-- SELECT brand, model, condition, price FROM cars
--   WHERE price < 250000
--   OR brand = 'Porsche';

-- SELECT brand, model, condition, price FROM cars
--   WHERE (price < 250000
--   OR brand = 'Porsche')
--   AND condition > 3;

-- SELECT brand, model, year, color, price, FROM cars
--   WHERE color LIKE '%red%' OR year BETWEEN 1960 AND 1969;

-- SELECT brand, model, year, color, price, sold FROM cars
--   WHERE (color LIKE '%red%' OR year BETWEEN 1960 AND 1969)
--   AND sold IS FALSE;


        -- SEARCHING FOR MULTIPLE VALUES IN A COLUMN --
-- SELECT brand, model, price, sold FROM cars
--   WHERE brand in ('Ford', 'Chevrolet', 'Ferrari')
--   AND sold IS FALSE;

-- SELECT brand, model, condition, year FROM cars
--   WHERE year IN (1961, 1963, 1965, 1967, 1969)
--   AND condition >= 3 
--   AND sold IS FALSE;

-- SELECT brand, model, price, sold FROM cars
--   WHERE (brand NOT IN ('Ford', 'Triumph', 'Chevrolet', 'Dodge')
--   OR price < 50000)
--   AND sold IS FALSE;


          -- CHALLENGES --
-- SELECT brand, model, color from cars
--   WHERE color LIKE '%red%'
--   AND brand NOT IN ('Ferrari')
--   AND sold IS FALSE;

-- SELECT brand, model, color FROM cars
--   WHERE color NOT IN ('red', 'blue', 'white')
--   AND brand NOT IN ('Aston Martin', 'Bentley', 'Jaguar')
--   AND sold IS FALSE;

-- SELECT brand, model, year, sold FROM cars
-- WHERE ((brand = 'Dodge' AND year between 1960 AND 1969)
-- OR (brand IN ('Ford', 'Triumph') AND year BETWEEN 1970 AND 1979))
-- AND sold IS FALSE;


          -- SORT ORDER --
-- SELECT brand, model, year FROM cars
--   ORDER BY brand DESC, year;

-- SELECT brand, model, condition, price FROM cars
--   ORDER BY condition DESC, price;

-- SELECT brand, model, condition, price FROM cars
-- WHERE sold IS FALSE
-- AND condition != 5
-- ORDER BY condition DESC, price;

-- SELECT brand, model, year, price FROM cars
--   ORDER BY price DESC 
--   LIMIT 1;

-- SELECT brand, model, color, price FROM cars
--   WHERE color LIKE '%red%'
--   AND sold IS FALSE
--   ORDER BY price 
--   LIMIT 5;


          -- AGGREGATES --
-- SELECT COUNT(*) AS total_sold FROM cars
--   WHERE sold IS TRUE;

-- SELECT SUM(price) AS total_earnings FROM cars
-- WHERE sold IS TRUE

-- SELECT MAX(price) AS most_expensive FROM cars
--   WHERE sold IS TRUE;

-- SELECT AVG(price) FROM cars
--   WHERE brand = 'Bentley';

-- SELECT FLOOR(AVG(price)) AS average FROM cars
--   WHERE brand = 'Bentley';

-- SELECT CEIL(AVG(price)) AS avg, MAX(price), MIN(price) FROM cars
--   WHERE sold IS TRUE;


          -- GROUPING COLUMNS --
--  SELECT brand, COUNT(brand) AS brand_count FROM cars
--   GROUP BY brand;

-- SELECT condition, COUNT(condition) FROM cars
--   GROUP BY condition;

-- SELECT brand, COUNT(brand), FLOOR(AVG(price)) as AVG 
--   FROM cars
--   WHERE sold IS FALSE
--   GROUP BY brand;

-- SELECT brand, COUNT(brand), FLOOR(AVG(price)) as AVG
--   FROM cars
--   WHERE sold IS FALSE
--   GROUP BY brand
--   HAVING COUNT(brand) > 1;

-- SELECT year, COUNT(year) AS car_count, MAX(price), MIN(price)
--   FROM cars
--   WHERE sold IS TRUE
--   GROUP BY year
--   HAVING COUNT(year) > 1
--   ORDER BY car_count;

          -- CHALLENGES --
-- SELECT brand, model, year
--   FROM cars
--   WHERE sold IS FALSE
--   ORDER BY year
--   LIMIT 5;

-- SELECT color, COUNT(color)
--   FROM cars
--   WHERE sold IS NOT TRUE
--   GROUP BY color
--   HAVING COUNT(color) > 2
--   ORDER BY COUNT(color) DESC;


          -- MANIPULATING DATA --
          --*(THESE DIDN'T REALLY SHOW IN DB, IT'S HARD CODED)* --
-- INSERT INTO cars (
--   brand, model, year, price, color, condition, sold
-- ) VALUES (
--   'Ford', 'Escort RS2000', 1978, 39000, 'blue', 5, FALSE
-- ), (
-- 	'Aston Martin', 'V8 Vantage', 1977, 145000, 'dark green', 5, FALSE
-- ), (
--   'Chevrolet', 'Bel Air', 1955, 50000, 'purple', 5, FALSE
-- ), (
--   'Porsche', '944 Turbo', 1986, 48000, 'white', 4, FALSE
-- )

-- UPDATE cars 
--   SET sold = TRUE
--   WHERE brand = 'FORD'
--   AND model = 'Escort RS2000';

-- UPDATE cars 
--   SET condition = 5, price = 465000
--   WHERE brand = 'Aston Martin'
--   AND model = 'DB4'
--   AND id = 14;

-- UPDATE cars
--   SET condition = 1, price = 10000
--   WHERE brand = 'Porsche'
--   AND sold IS FALSE;

-- DELETE FROM cars WHERE condition = 0;

-- DELETE FROM cars WHERE sold IS TRUE;


          -- JOINING TABLES --
-- SELECT brand, model, price, sold, sold_price
--   FROM sold_cars SC
--   LEFT JOIN cars C ON SC.cars_id = C.id;

-- SELECT brand, model, price, sold, sold_price
--   FROM sold_cars SC
--   RIGHT JOIN cars C ON SC.cars_id = C.id;

-- SELECT name, role, city, state
--   FROM staff S
--   RIGHT JOIN dealerships D ON S.dealership_id = D.id;

SELECT name, role, city, state
  FROM staff S
  FULL JOIN dealerships D ON s.dealership_id = D.id;