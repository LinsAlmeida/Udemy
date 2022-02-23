create database cursores;

use cursores;

create table vendedores(
    idvendedor int primary key auto_increment,
    nome varchar(30),
    jan int,
    fev int,
    mar int
);

insert into vendedores values(null,'lucas',12234,1562,6273);
insert into vendedores values(null,'joao',4563,562,673);
insert into vendedores values(null,'renato',2351,3452,1243);
insert into vendedores values(null,'julia',15363,2341,763);
insert into vendedores values(null,'luciana',4353,65435,345);
insert into vendedores values(null,'gustavo',4534,5342,76334);

select * from vendedores;

select nome, (jan+fev+mar) as total from vendedores; --> soma do meses

select nome, (jan+fev+mar) as total, (jan+fev+mar)/3 as media from vendedores; --> média e soma dos meses

create table vend_total(
    nome varchar(50),
    jan int,
    fev int,
    mar int,
    total int,
    media int
);

/* Esse cursor tem como obejtivo fazer uma soma de 3 messês e depois gerar uma media */

delimiter $

CREATE PROCEDURE INSEREDADOS()
BEGIN
		DECLARE FIM INT DEFAULT 0;
		DECLARE VAR1, VAR2, VAR3, VTOTAL, VMEDIA INT;
		DECLARE VNOME VARCHAR(50);
		
		DECLARE REG CURSOR FOR(
			SELECT NOME, JAN, FEV, MAR FROM VENDEDORES
		);
		
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET FIM = 1;
		
		OPEN REG;
		
		REPEAT
		
			FETCH REG INTO VNOME, VAR1, VAR2, VAR3;
			IF NOT FIM THEN
			
				SET VTOTAL = VAR1 + VAR2 + VAR3;
				SET VMEDIA = VTOTAL / 3;
				
				INSERT INTO VEND_TOTAL VALUES(VNOME,VAR1,VAR2,VAR3,VTOTAL,VMEDIA);
				
			END IF;
			
		UNTIL FIM END REPEAT;
		
		CLOSE REG;
END
$

delimiter ;

select * from vendedores;
select * from vend_total;


