1
SELECT model, speed, hd
FROM PC
WHERE price < 500

2
select distinct maker 
from product
where type = 'Printer'

3
select model, ram, screen
from laptop
where price > 1000

4
select *
from Printer
where color = 'y'

5
select model, speed, hd
from pc
where (cd = '12x' or cd = '24x') and price < 600

6
select distinct product.maker, laptop.speed
from laptop
inner join product on product.model = laptop.model
where laptop.hd >= 10

7
select pc.model, pc.price
from pc
join product on product.model = pc.model
where product.maker = 'B'
union
select laptop.model, laptop.price
from laptop
join product on product.model = laptop.model
where product.maker = 'B'
union
select printer.model, printer.price
from printer
join product on product.model = printer.model
where product.maker = 'B'

8
select distinct maker
from product
where type = 'pc'
and maker not in (select maker from product where type = 'laptop')

9
Select distinct maker
from product
join pc on pc.model = product.model
where speed >= 450

10
select model, price
from printer 
where price = (select max(price) from printer)

11
Select avg(speed)
from pc

12
select avg(speed)
from laptop
where price > 1000

13
Select avg(speed)
from pc
join product on pc.model = product.model
where maker = 'A'

14
Select Ships.class, Ships.name, classes.country
from ships
join classes on ships.class = classes.class
where numguns >= 10

15
Select HD
from pc
group by HD
having count(hd) >= 2

16
select distinct
case when p1.model > p2.model then p1.model else p2.model end as model1,
case when p1.model < p2.model then p1.model else p2.model end as model2,
p1.speed,
p1.ram
from pc p1
join
pc p2 on p1.speed = p2.speed and p1.ram = p2.ram and p1.model <> p2.model
order by model1, model2;

17
Select distinct product.type, laptop.model, laptop.speed
from laptop
join product on product.model = laptop.model
where laptop.speed < (select min(speed)
from pc)

18
select maker, price 
from printer
join product on product.model = printer.model
where price = (select  min(price)
from printer
where color = 'y')
and color = 'y'
group by maker, price

19
Select maker, avg(screen)
from product
join laptop on product.model = laptop.model
group by maker

20
Select maker, count(model) as count_model
from product
where type = 'pc'
group by maker
having count(model) >= 3

21
select maker, max(price)
from product
join pc on product.model = pc.model
group by maker

22
Select speed, avg(price)
from pc
where speed > 600
group by speed

23
Select maker
from product
join laptop on product.model = laptop.model
where speed >= 750
intersect
Select maker
from product
join pc on product.model = pc.model
where speed >= 750
	
24
with allproducts as (
    select model, price from pc
    union all
    select model, price from laptop
    union all
    select model, price from printer
)
select model
from allproducts
where price in (select max(price)
from allproducts)

25
Select distinct maker
from pc 
join product on product.model = pc.model
where ram in (select min(ram) from pc) and
speed in (select max(speed) from pc where ram in (select min(ram) from pc))
intersect
select maker 
from product
where type = 'Printer'

26
with allPrice as (
Select price as priceA
from pc
join product on product.model = pc.model
where maker = 'A'
union all
Select price as priceA
from laptop
join product on product.model = laptop.model
where maker = 'A'
) 
select avg(priceA) as AVG_price
from allPrice

27
select maker, avg(hd)
from product 
join pc on product.model=pc.model
where maker in (
select maker
from product
where type='printer'
)
group by maker

28
select count(*)
from (
select maker
from product
group by maker
having count(model) = 1
) as model_makers

29
SELECT i.point, i.date, i.inc, o.out
FROM income_o i
LEFT JOIN outcome_o o ON i.point = o.point AND i.date = o.date
UNION
SELECT o.point, o.date, i.inc, o.out
FROM outcome_o o
LEFT JOIN income_o i ON o.point = i.point AND o.date = i.date

30
WITH cte_out AS (
    SELECT point, date, SUM(out) AS out
    FROM outcome
    GROUP BY point, date
) , cte_inc AS (
    SELECT point, date, SUM(inc) AS inc
    FROM income
    GROUP BY point, date
)

SELECT i.point, i.date, o.out, i.inc
FROM cte_inc i
LEFT JOIN cte_out o ON i.point = o.point AND i.date = o.date
UNION
SELECT o.point, o.date, o.out, i.inc
FROM cte_out o
