CREATE OR REPLACE FUNCTION nm_setor()
 RETURNS trigger
 LANGUAGE plpgsql
AS $$
declare 
F_nome_setor varchar;
F_id_atividade int;
begin
	
	select r.id_atividade ,s.nome_setor into F_id_atividade,F_nome_setor  from reserva r join funcionario f 
	on r.id_solicitante = f.id_funcionario join cargo c 
	on f.id_cargo = c.id_cargo join setor s 
	on c.id_setor = s.id_setor where r.id_atividade = new.id_atividade;

	

	update servico set setor_solicitante = F_nome_setor where id_atividade = F_id_atividade;

	return new;
end;
$$
;

create trigger atualizar_setor
after insert on servico
for each row 
execute procedure nm_setor();
