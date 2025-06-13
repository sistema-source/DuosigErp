SET TERM ^ ;

-- Domínio para TIMESTAMP
CREATE DOMAIN D_AGORA
  AS TIMESTAMP;
^

-- Domínio para texto grande (BLOB)
CREATE DOMAIN D_BLOBTEXTO
  AS VARCHAR(255)
  CHARACTER SET WIN1252
  COLLATE WIN1252;
^

-- Domínio para e-mail
CREATE DOMAIN D_EMAIL
  AS VARCHAR(255)
  CHARACTER SET WIN1252
  COLLATE WIN1252;
^

-- Domínio para IDs (CHAR de 36 caracteres, provavelmente para UUID/GUID)
CREATE DOMAIN D_ID
  AS CHAR(36) NOT NULL -- Marcado como NOT NULL na imagem
  CHARACTER SET WIN1252
  COLLATE WIN1252;
^

-- Domínio para nomes
CREATE DOMAIN D_NOME
  AS VARCHAR(60)
  CHARACTER SET WIN1252
  COLLATE WIN1252;
^

-- Domínio para números inteiros
CREATE DOMAIN D_NUMERO
  AS INTEGER;
^

-- Domínio para senhas (Numeric com 8 dígitos e 0 casas decimais)
CREATE DOMAIN D_SENHA
  AS NUMERIC(8, 0);
^

-- Domínio para status inteiro
CREATE DOMAIN D_STA_INT
  AS INTEGER;
^

-- Domínio para ID de usuário
CREATE DOMAIN D_USUARIOID
  AS VARCHAR(30)
  CHARACTER SET WIN1252
  COLLATE WIN1252;
^

SET TERM ; ^

COMMIT;