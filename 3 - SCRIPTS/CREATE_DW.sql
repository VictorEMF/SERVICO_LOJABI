
CREATE SEQUENCE public.dm_avaliacao_sk_id_avaliacao_seq;

CREATE TABLE public.dm_avaliacao (
                sk_id_avaliacao INTEGER NOT NULL DEFAULT nextval('public.dm_avaliacao_sk_id_avaliacao_seq'),
                nk_id_avaliacao INTEGER NOT NULL,
                avaliacao VARCHAR(50) NOT NULL,
                dado_versao INTEGER DEFAULT 1 NOT NULL,
                data_primeiro_dado TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
                data_ultimo_dado TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
                CONSTRAINT dm_avaliacao_pk PRIMARY KEY (sk_id_avaliacao)
);


ALTER SEQUENCE public.dm_avaliacao_sk_id_avaliacao_seq OWNED BY public.dm_avaliacao.sk_id_avaliacao;


CREATE SEQUENCE public.dm_atividade_sk_id_atividade_seq;

CREATE TABLE public.dm_atividade (
                sk_id_atividade INTEGER NOT NULL DEFAULT nextval('public.dm_atividade_sk_id_atividade_seq'),
                sk_id_responsavel INTEGER NOT NULL,
                sk_id_solicitante INTEGER NOT NULL,
                nk_id_atividade INTEGER NOT NULL,
                cod_atividade VARCHAR NOT NULL,
                descricao VARCHAR(1500) NOT NULL,
                tipo VARCHAR(7) NOT NULL,
                data_inicio TIMESTAMP NOT NULL,
                data_previsao TIMESTAMP NOT NULL,
                data_finalizacao TIMESTAMP,
                atraso VARCHAR(3),
                dado_versao INTEGER DEFAULT 1 NOT NULL,
                data_primeiro_dado TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
                data_ultimo_dado TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
                CONSTRAINT dm_atividade_pk PRIMARY KEY (sk_id_atividade)
);


ALTER SEQUENCE public.dm_atividade_sk_id_atividade_seq OWNED BY public.dm_atividade.sk_id_atividade;

CREATE TABLE public.ft_servico (
                sk_id_atividade INTEGER NOT NULL,
                sk_id_avaliacao INTEGER,
                sk_id_loja INTEGER NOT NULL,
                setor_solicitante VARCHAR NOT NULL,
                dado_versao INTEGER DEFAULT 1 NOT NULL,
                data_primeiro_dado TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
                data_ultimo_dado TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.ft_servico ADD CONSTRAINT dm_avaliacao_ft_servico_fk
FOREIGN KEY (sk_id_avaliacao)
REFERENCES public.dm_avaliacao (sk_id_avaliacao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;


ALTER TABLE public.ft_servico ADD CONSTRAINT dm_loja_ft_servico_fk
FOREIGN KEY (sk_id_loja)
REFERENCES public.dm_loja (sk_id_loja)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.dm_atividade ADD CONSTRAINT dm_funcionario_ft_atividade_fk
FOREIGN KEY (sk_id_responsavel)
REFERENCES public.dm_funcionario (sk_id_funcionario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.dm_atividade ADD CONSTRAINT dm_funcionario_ft_atividade_fk1
FOREIGN KEY (sk_id_solicitante)
REFERENCES public.dm_funcionario (sk_id_funcionario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_servico ADD CONSTRAINT dm_atividade_ft_servico_fk
FOREIGN KEY (sk_id_atividade)
REFERENCES public.dm_atividade (sk_id_atividade)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;