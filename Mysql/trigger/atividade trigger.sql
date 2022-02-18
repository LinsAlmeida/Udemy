create database shop;

use shop;

create table produto(
	idproduto int PRIMARY key auto_increment,
	nome varchar (30),
	valor float (10,2)
);

create database BKP;

use BKP;

create table bkp_prod(
	IDBKP int PRIMARY key auto_increment,
	idproduto int,
	nome varchar(30),
	valor float (10,2)
);

use shop

insert into BKP.bkp_prod values(null,2000,'tenis',123.00);

alter table bkp.bkp_prod
add evento char (1);



create trigger bkp_prod_insert
after insert on produto
for each row 
BEGIN
	
	insert into Bkp.BKP_prod values(null,new.idproduto,
	new.nome,new.valor,'i');
	

END
$

delimiter ;

insert into produto values(null,'Nike',1500.00);
insert into produto values(null,'tenis adidas',2500.00);


delimiter $

create trigger bkp_prod_delete
after delete on produto
for each row 
begin
		insert into Bkp.BKP_prod values(null,old.idproduto,
		old.nome,old.valor,'d');

end
$