SORULAR
1.  film tablosunda film uzunluğu length sütununda gösterilmektedir. Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır?
2.  film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?
3.    film tablosunda en düşük rental_rate ve en düşün replacement_cost değerlerine sahip filmleri sıralayınız.
4.   payment tablosunda en fazla sayıda alışveriş yapan müşterileri(customer) sıralayınız.-----

CEVAPLAR

1. SELECT COUNT(title) FROM film
WHERE length >
(SELECT AVG(length) from film);

2. SELECT count(title) FROM film
WHERE rental_rate =
(SELECT MAX(rental_rate) FROM film);

3. SELECT title FROM film
WHERE rental_rate= 
(SELECT MIN(rental_rate) from film) AND replacement_cost = (SELECT MIN(replacement_cost) from film);

4. SELECT first_name, last_name, COUNT(payment.customer_id) FROM payment
JOIN customer ON payment.customer_id=customer.customer_id
GROUP BY first_name, last_name, payment.customer_id
ORDER BY  COUNT(payment.customer_id) DESC
;