create table petsale(
id integer NOT NULL,
pet char(20),
saleprice decimal(6,2),
profit decimal(6,2),
saledate date
);

create table pet(
id integer not null,
animal varchar(20),
quantity integer
);