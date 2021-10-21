#How many distinct (different) actors' last names are there?
#In how many different languages where the films originally produced? (Use the column language_id from the film table)
#How many movies were released with "PG-13" rating?
#Get 10 the longest movies from 2006.
#How many days has been the company operating (check DATEDIFF() function)?
#Show rental info with additional columns month and weekday. Get 20.
#Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
#How many rentals were in the last month of activity?

use sakila;

select count(distinct last_name) from actor;
select count(distinct language_id) from film;
select count(film_id) from film
where rating = 'PG-13';
select title, length, release_year from film
where release_year >= '2006'
order by length desc
limit 10;

select min(payment_date) from payment;
select max(payment_date) from payment;
select DATEDIFF('2006-02-14', '2005-05-24');
select *, extract(month from rental_date) as month from rental;	
select *, weekday(rental_date) as weekday from rental; 
select *, case when date_format(convert(rental_date, date), '%W') in ('sunday','saturday')
then 'weekend'
else 'weekday'
end as 'weekday_type'
from rental;

select count(rental_id) from rental
where rental_date like '%-05%';

