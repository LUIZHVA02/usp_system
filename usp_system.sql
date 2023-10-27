create database usp_system;

use usp_system;

create table alunos
(
	id_aluno int primary key not null,
    nome_aluno varchar(200),
    cpf numeric(11),
    telefone numeric(15),
    email varchar(200),
    data_nasc date,
    data_matricula date,
    data_inscricao date
);

insert into alunos	(id_aluno, nome_aluno, cpf, telefone, email, 
					data_nasc, data_matricula, data_inscricao)values
(1,'Rubens Luiz Lobo','62858135538','5511915354685',
'rubenslobo@gmail.com','2004-03-16','2023-02-20','2023-12-20'),

(2,'Jéssica Pereira', '52168116741','5511965167255',
'annaeelza@gmail.com', '2004-12-02','2023-02-20','2022-12-20'),

(3,'Paulo H. R. L. Escobar', '51684161651', '55119516164165',
'paulorezende@gmail.com', '2003-03-16','2023-02-20','2023-10-20'),

(4,'Marcos Dos Santos Araujo', '45132568256', '5511987517615',
'marcoslh65@gmail.com', '1980-04-25','2023-02-20','2022-12-20'),

(5, 'Edna Vidal Araujo','14267846857','5511975228860',
'ednavidal@gmail.com','1971-11-22','2023-09-20','2022-12-20');

create table professores
(
	id_professor int primary key not null,
    nome_professor varchar(200),
    cpf numeric(11),
    telefone numeric(15),
    email varchar(200),
    data_nasc date
);

insert into professores (id_professor, nome_professor, cpf, telefone, email, data_nasc)values
(1,'Bruno Gomes da Silva','36565148598',
5511926465488,'brunogomes@gmail.com','1998-05-23'),
(2,'Edilton Jose da Silva','12656256214',
5511965468545, 'ediltonsilva@gmail.com','1983-08-17'),
(3,'Celso Marcos Furtado','25545748521',
5511964548654,'celsofurtado@gmail.com','1968-06-28'),
(4,'Rita de Cassia','25478565452',
5511965468465,'ritacassia@gmail.com','1979-03-09'),
(5,'Vitor de Jesus','12336548659',
5511965452846,'vitorsantana@gmail.com','1999-10-05');

create table cursos
(
	id_curso int primary key not null,
    nome_curso varchar(100),
    tipo_curso varchar(100),
    carga_horaria bigint
);

insert into cursos(id_curso, nome_curso, tipo_curso, carga_horaria)values
(1, 'Banco de Dados', 'Graduação', 1200),
(2, 'Sistemas Operacionais', 'Pós-Graduação', 750),
(3, 'Fundamentos da Programação Orientada a Objeto', 'Graduação', 1200),
(4, 'Hardware', 'Curso Livre', 500),
(5, 'Redes de Computadores', 'Formação Continuada', 750);

create table empresas
(
	id_empresa int primary key not null,
    nome_empresa varchar(100),
    telefone numeric(15),
    cnpj numeric(14),
    email varchar(200)
);

insert into empresas(id_empresa, nome_empresa, telefone, cnpj, email)values
(1, 'Microsoft', 5511442652265, 37151654524615, 'mycrosoft@outlook.com.br'),
(2, 'Apple', 5511452687951, 13543528465156, 'apple@icloud.com.br'),
(3, 'Google', 5511478953264, 51642503543552, 'google@gmail.com'),
(4, 'SENAI', 5511425687915, 51684615351311, 'senai@sesisenaisp.edu.br'),
(5, 'Mercedes', 5511425875658, 26512651523351, 'mercedes@gmail.com');

create table eventos
(
	id_evento int primary key not null,
    nome_evento varchar(100),
    id_empresa int,
    id_aluno int,
    id_professor int,
    data_evento datetime,
    
    foreign key(id_empresa) references empresas (id_empresa),
    foreign key(id_aluno) references alunos(id_aluno)
);
insert into eventos(id_evento, nome_evento, id_empresa, id_aluno, id_professor, data_evento)values
(1, 'Intervalo Musical', 1, 1, 1, '2023-11-01'),
(2, 'Intervalo Musical', 1, 2, 1, '2023-09-29'),
(3, 'Intervalo Musical', 1, 3, 1, '2023-08-25'),
(4, 'Stand-up Comedy', 4, 3, 5, '2023-09-15'),
(5, 'Palestra - Brigada de Incêndio', 2, 5, 4, '2023-08-30');

create table materias
(
	id_materia int primary key not null,
    carga_horaria int,
    nome_materia varchar(100),
    id_curso int,
    id_professor int,
    
    foreign key(id_curso) references cursos(id_curso),
    foreign key(id_professor) references professores (id_professor)
);

create table pesquisas
(
	id_pesquisa int primary key not null,
    nome_pesquisa varchar (100),
    descricao varchar (200),
    id_aluno int,
    id_materia int,
    id_professor int,
    
    foreign key(id_aluno) references alunos (id_aluno),
    foreign key(id_materia) references materias(id_materia),
    foreign key(id_professor) references professores (id_professor)
);

create table turmas
(
	id_turma int primary key not null,
    id_curso int,
    id_professor int,
    id_aluno int,
    codigo_turma varchar(50),
    
    foreign key(id_aluno) references alunos (id_aluno),
    foreign key(id_curso) references cursos(id_curso),
    foreign key(id_professor) references professores (id_professor)
);

create table notas
(
	id_nota int primary key not null,
    id_aluno int,
    id_materia int,
    notas numeric(5),
    
    foreign key(id_aluno) references alunos (id_aluno),
    foreign key(id_materia) references materias(id_materia)
);

create table presenca
(
	id_presenca int primary key not null,
    id_aluno int,
    id_turma int,
    data_aula date,
    situacao varchar(10),
    
    foreign key(id_aluno) references alunos (id_aluno),
    foreign key(id_turma) references turmas(id_turma)
);

