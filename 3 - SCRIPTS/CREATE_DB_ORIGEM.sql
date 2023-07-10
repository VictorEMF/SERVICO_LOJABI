create table projeto(
	id_projeto varchar(100) primary key,
	id_responsavel int,
	id_solicitante int,
	nome_projeto varchar(100),
	descricao varchar(500),
	data_inicio timestamp,
	data_previsao timestamp,
	data_finalizacao timestamp,
	atraso char(3)
	foreign key(id_responsavel) references funcionario(id_funcionario),
	foreign key(id_solicitante) references funcionario(id_funcionario)
);

create table chamado(
	id_chamado varchar(100) primary key,
	id_atendente int,
	id_solicitante int,
	tipo_chamado varchar(100),
	descricao varchar(500),
	data_inicio timestamp,
	data_previsao timestamp,
	data_finalizacao timestamp,
	atraso char(3)
	foreign key(id_atendente) references funcionario(id_funcionario),
	foreign key(id_solicitante) references funcionario(id_funcionario)
);

create table avaliacao(
	id_avaliacao serial primary key,
	avaliacao varchar(50)
);

create table reserva(
	id_atividade serial primary key,
	cod_atividade varchar,
	id_responsavel int,
	id_solicitante int,
	id_loja int,
	id_avaliacao int,
	descricao varchar(1500),
	tipo char(7),
	data_inicio timestamp,
	data_previsao timestamp,
	data_finalizacao timestamp,
	atraso char(3)
	foreign key(id_responsavel) references funcionario(id_funcionario),
	foreign key(id_solicitante) references funcionario(id_funcionario),
	foreign key(id_loja) references loja(id_loja),
	foreign key(id_avaliacao) references avaliacao(id_avaliacao)
);


