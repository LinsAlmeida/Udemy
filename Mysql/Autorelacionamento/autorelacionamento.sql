create database aula44;

use aula44;

create TABLE curso (
    idcurso INT primary key auto_increment,
    nome VARCHAR(30),
    horas int,
    valor FLOAT(10,2),
    id_prereq int
);

/*chave estrangeira */
alter table curso add constraint fk_prereq
foreign key (id_prereq) references curso(idcurso);


/*insert de dados na tabela */
insert into curso VALUES(null,'bd relacional',20,400,null);
insert into curso VALUES(null,'bussines inteligence',40,800,1);
insert into curso VALUES(null,'relatorios avançados ',220,600,2);
insert into curso VALUES(null,'Lógica de programação',20,400,null);
insert into curso VALUES(null,'ruby',30,700,4);

select * from curso;

/*Query que puxa as informações */
SELECT NOME, VALOR, HORAS, IFNULL(id_prereq,'SEM REQUISITO') REQUISITO
FROM curso; 

/* realizar uma query que traga o nome, valor
horas e o nome do pre requisito do curso*/

/* Essa query traz somente os curso que contem pre-requisitos */
select
c.nome as curso,
c.valor as valor,
c.horas as CargaHoraria,
ifnull(p.nome, '----' ) as prereq
from curso C
inner join curso P
on p.idcurso = c.id_prereq;

/* já essa query traz todos os cursos e seus pre-requisitos 
isso ocorre por conta da utilização do left join no lugar do inner joi*/
select
c.nome as curso,
c.valor as valor,
c.horas as CargaHoraria,
ifnull(p.nome, '----' ) as prereq
from curso C left join curso P
on p.idcurso = c.id_prereq;