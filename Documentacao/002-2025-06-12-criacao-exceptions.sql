SET TERM ^ ;

-- EXCEÇÃO: Erro ao gerar o ID do registro
-- Descrição: "Gerasro Id" (Ajustei para "Gerar ID" se for um erro de digitação, caso contrário, mantenho "Gerasro Id" se for intencional)
CREATE EXCEPTION EX_UID_COLISAO 'Erro ao gerar o ID do registro';
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