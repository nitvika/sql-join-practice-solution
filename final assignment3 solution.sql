use mavenmovies;

select first_name,last_name,email,city from customer c join address a on c.address_id=a.address_id join city ci on a.city_id=ci.city_id;

select title,description,release_year from film where rental_rate>= (select max(rental_rate) from film);
 
 select first_name,last_name,rental_date,title from customer c left join rental r on c.customer_id=r.customer_id 
 join inventory i on r.inventory_id=i.inventory_id join film f on i.film_id=f.film_id group by rental_id;
 
 select title, count(*) from actor a join film_actor fa on a.actor_id=fa.actor_id join film f on fa.film_id=f.film_id group by f.film_id;
 
 select first_name,last_name,email,rental_date,title,return_date from customer c join rental r on c.customer_id=r.customer_id join 
 inventory i on r.inventory_id=i.inventory_id join film f on i.film_id=f.film_id ;

 select title from film f join inventory i on f.film_id=i.film_id join rental r on i.inventory_id=r.inventory_id join customer c on 
 r.customer_id=c.customer_id where c.email like "%.net";
 
 select first_name,last_name, count(*) from rental r join customer c on r.customer_id=c.customer_id group by  r.customer_id;
 
 select first_name from customer where customer_id in (select customer_id from rental where 
 count(*)>=(select avg(count(rental_id)) from rental) group by customer_id);
 
 select c1.first_name,c1.last_name,c1.email,c2.first_name as others from customer c1 join address a1 on c1.address_id=a1.address_id 
 join address a2 on a1.city_id=a2.city_id and a1.address_id!=a2.address_id join customer c2 on a2.address_id=c2.address_id;
 
 select title,rental_rate from film f join film_category fc on f.film_id=fc.film_id where rental_rate>(select avg(rental_rate) from film);
 
 select f1.title,f1.description,f1.length,f1.rental_rate from film f1 join film f2 on 
 f1.release_year=f2.release_year where f1.rental_rate>(select avg(rental_rate) from film f2);

  select c.first_name,c.last_name,c.email from customer c  where customer_id in (select distinct (c2.customer_id) from customer c2 join
  rental r on c2.customer_id=r.customer_id join inventory i on r.inventory_id=i.inventory_id join
 film_category fc on i.film_id=fc.film_id join category ca on fc.category_id=ca.category_id where ca.name="documentary");
 
 select title, rental_rate, rental_rate-(select avg(rental_rate) from film) as diff from film;
 
 select title from film where film_id not in (select distinct(film_id) from inventory where film_id is not null);
 
 select title from film f1 where rental_rate>(select avg(rental_rate) from film f2 where f1.release_year=f2.release_year) and
 film_id in (select fc.film_id from film_category fc join category c on fc.category_id=c.category_id where c.name="sci-fi");
 
 select customer_id,count(rental_id) as no_of_film from rental group by customer_id having count(rental_id)>=5;
 