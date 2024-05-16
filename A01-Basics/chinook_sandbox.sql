.open Chinook.db
.tables

.headers on
.mode box -- other modes are column, tab, csv, html, json, and markdown

select * from playlist;

select * from genre;

select * from album;

select City, State, Country, PostalCode from customer;

select InvoiceDate from invoice;


select FirstName, LastName, Title from employee;