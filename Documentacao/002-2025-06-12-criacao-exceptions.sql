Insert into MIGRATIONS(NOME_MIGRATION) values('002-2025-06-12-criacao-exceptions.slq');
SET TERM ^ ;


^

-- EXCEÇÃO: Não pode fazer alteração em registro apagado
-- Descrição: "Registro Apagado"
CREATE EXCEPTION EX_UPDATE_REG_DEL 'Nro pode fazer alteracao em registro apagado'; -- Mantive "Nro" como na imagem
^

-- EXCEÇÃO: Não pode gravar registro com Usuario nulo
-- Descrição: "Usuario Nulo"
CREATE EXCEPTION EX_USER_NULO 'Nao pode gravar registro com Usuario nulo'; -- Mantive "Nao" como na imagem
^

SET TERM ; ^

COMMIT;
