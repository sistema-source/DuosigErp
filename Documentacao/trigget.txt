-- #############################################
-- #               CRIACAO DE TRIGGERS         #
-- #         (Identicos para todas as tabelas) #
-- #############################################

-- Criacao das Excecoes (se ja existirem, pulara ou causara um erro, dependendo do SGBD/versao)
SET TERM ^ ;
CREATE EXCEPTION EX_UID_COLISAO 'Nao foi possivel gerar um UUID unico apos varias tentativas.';
CREATE EXCEPTION EX_USER_NULO 'Usuario nao pode ser nulo na criacao/atualizacao/delecao.';
CREATE EXCEPTION EX_UPDATE_REG_DEL 'Nao eh permitido atualizar um registro que ja esta marcado como deletado.';
^
SET TERM ; ^


-- #############################################
-- #          TRIGGERS BEFORE INSERT           #
-- #############################################

SET TERM ^ ;

-- TBL0001_BI
CREATE TRIGGER TBL0001_BI FOR TBL0001
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0001 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0002_BI
CREATE TRIGGER TBL0002_BI FOR TBL0002
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0002 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0003_BI
CREATE TRIGGER TBL0003_BI FOR TBL0003
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0003 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0004_BI
CREATE TRIGGER TBL0004_BI FOR TBL0004
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0004 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0005_BI
CREATE TRIGGER TBL0005_BI FOR TBL0005
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0005 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0006_BI
CREATE TRIGGER TBL0006_BI FOR TBL0006
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0006 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0007_BI
CREATE TRIGGER TBL0007_BI FOR TBL0007
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0007 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0008_BI
CREATE TRIGGER TBL0008_BI FOR TBL0008
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0008 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0009_BI
CREATE TRIGGER TBL0009_BI FOR TBL0009
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0009 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0010_BI
CREATE TRIGGER TBL0010_BI FOR TBL0010
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0010 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0011_BI
CREATE TRIGGER TBL0011_BI FOR TBL0011
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0011 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0012_BI
CREATE TRIGGER TBL0012_BI FOR TBL0012
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0012 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0013_BI
CREATE TRIGGER TBL0013_BI FOR TBL0013
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0013 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0014_BI
CREATE TRIGGER TBL0014_BI FOR TBL0014
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0014 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0015_BI
CREATE TRIGGER TBL0015_BI FOR TBL0015
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0015 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0016_BI
CREATE TRIGGER TBL0016_BI FOR TBL0016
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0016 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0017_BI
CREATE TRIGGER TBL0017_BI FOR TBL0017
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0017 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0018_BI
CREATE TRIGGER TBL0018_BI FOR TBL0018
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0018 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0019_BI
CREATE TRIGGER TBL0019_BI FOR TBL0019
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0019 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0020_BI
CREATE TRIGGER TBL0020_BI FOR TBL0020
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0020 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0021_BI
CREATE TRIGGER TBL0021_BI FOR TBL0021
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0021 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0022_BI
CREATE TRIGGER TBL0022_BI FOR TBL0022
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0022 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0023_BI
CREATE TRIGGER TBL0023_BI FOR TBL0023
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0023 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0024_BI
CREATE TRIGGER TBL0024_BI FOR TBL0024
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0024 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0025_BI
CREATE TRIGGER TBL0025_BI FOR TBL0025
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0025 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0026_BI
CREATE TRIGGER TBL0026_BI FOR TBL0026
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0026 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0027_BI
CREATE TRIGGER TBL0027_BI FOR TBL0027
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0027 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0028_BI
CREATE TRIGGER TBL0028_BI FOR TBL0028
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0028 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0029_BI
CREATE TRIGGER TBL0029_BI FOR TBL0029
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0029 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0030_BI
CREATE TRIGGER TBL0030_BI FOR TBL0030
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0030 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0031_BI
CREATE TRIGGER TBL0031_BI FOR TBL0031
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0031 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0032_BI
CREATE TRIGGER TBL0032_BI FOR TBL0032
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0032 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0033_BI
CREATE TRIGGER TBL0033_BI FOR TBL0033
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0033 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0034_BI
CREATE TRIGGER TBL0034_BI FOR TBL0034
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0034 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0035_BI
CREATE TRIGGER TBL0035_BI FOR TBL0035
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0035 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0036_BI
CREATE TRIGGER TBL0036_BI FOR TBL0036
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0036 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0037_BI
CREATE TRIGGER TBL0037_BI FOR TBL0037
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0037 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0038_BI
CREATE TRIGGER TBL0038_BI FOR TBL0038
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0038 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0039_BI
CREATE TRIGGER TBL0039_BI FOR TBL0039
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0039 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0040_BI
CREATE TRIGGER TBL0040_BI FOR TBL0040
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0040 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0041_BI
CREATE TRIGGER TBL0041_BI FOR TBL0041
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0041 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0042_BI
CREATE TRIGGER TBL0042_BI FOR TBL0042
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0042 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0043_BI
CREATE TRIGGER TBL0043_BI FOR TBL0043
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0043 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0044_BI
CREATE TRIGGER TBL0044_BI FOR TBL0044
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0044 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0045_BI
CREATE TRIGGER TBL0045_BI FOR TBL0045
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0045 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0046_BI
CREATE TRIGGER TBL0046_BI FOR TBL0046
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0046 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0047_BI
CREATE TRIGGER TBL0047_BI FOR TBL0047
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0047 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0048_BI
CREATE TRIGGER TBL0048_BI FOR TBL0048
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0048 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0049_BI
CREATE TRIGGER TBL0049_BI FOR TBL0049
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0049 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0050_BI
CREATE TRIGGER TBL0050_BI FOR TBL0050
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0050 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0051_BI
CREATE TRIGGER TBL0051_BI FOR TBL0051
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0051 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0052_BI
CREATE TRIGGER TBL0052_BI FOR TBL0052
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0052 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0053_BI
CREATE TRIGGER TBL0053_BI FOR TBL0053
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0053 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0054_BI
CREATE TRIGGER TBL0054_BI FOR TBL0054
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0054 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0055_BI
CREATE TRIGGER TBL0055_BI FOR TBL0055
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0055 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0056_BI
CREATE TRIGGER TBL0056_BI FOR TBL0056
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0056 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0057_BI
CREATE TRIGGER TBL0057_BI FOR TBL0057
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0057 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0058_BI
CREATE TRIGGER TBL0058_BI FOR TBL0058
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0058 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0059_BI
CREATE TRIGGER TBL0059_BI FOR TBL0059
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0059 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0060_BI
CREATE TRIGGER TBL0060_BI FOR TBL0060
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0060 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0061_BI
CREATE TRIGGER TBL0061_BI FOR TBL0061
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0061 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0062_BI
CREATE TRIGGER TBL0062_BI FOR TBL0062
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0062 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0063_BI
CREATE TRIGGER TBL0063_BI FOR TBL0063
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0063 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0064_BI
CREATE TRIGGER TBL0064_BI FOR TBL0064
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0064 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0065_BI
CREATE TRIGGER TBL0065_BI FOR TBL0065
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0065 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0066_BI
CREATE TRIGGER TBL0066_BI FOR TBL0066
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0066 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0067_BI
CREATE TRIGGER TBL0067_BI FOR TBL0067
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0067 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0068_BI
CREATE TRIGGER TBL0068_BI FOR TBL0068
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0068 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0069_BI
CREATE TRIGGER TBL0069_BI FOR TBL0069
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0069 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0070_BI
CREATE TRIGGER TBL0070_BI FOR TBL0070
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0070 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0071_BI
CREATE TRIGGER TBL0071_BI FOR TBL0071
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0071 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0072_BI
CREATE TRIGGER TBL0072_BI FOR TBL0072
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0072 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0073_BI
CREATE TRIGGER TBL0073_BI FOR TBL0073
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0073 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0074_BI
CREATE TRIGGER TBL0074_BI FOR TBL0074
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0074 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0075_BI
CREATE TRIGGER TBL0075_BI FOR TBL0075
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0075 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0076_BI
CREATE TRIGGER TBL0076_BI FOR TBL0076
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0076 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0077_BI
CREATE TRIGGER TBL0077_BI FOR TBL0077
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0077 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0078_BI
CREATE TRIGGER TBL0078_BI FOR TBL0078
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0078 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0079_BI
CREATE TRIGGER TBL0079_BI FOR TBL0079
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0079 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0080_BI
CREATE TRIGGER TBL0080_BI FOR TBL0080
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0080 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0081_BI
CREATE TRIGGER TBL0081_BI FOR TBL0081
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0081 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0082_BI
CREATE TRIGGER TBL0082_BI FOR TBL0082
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0082 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0083_BI
CREATE TRIGGER TBL0083_BI FOR TBL0083
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0083 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0084_BI
CREATE TRIGGER TBL0084_BI FOR TBL0084
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0084 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0085_BI
CREATE TRIGGER TBL0085_BI FOR TBL0085
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0085 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0086_BI
CREATE TRIGGER TBL0086_BI FOR TBL0086
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0086 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0087_BI
CREATE TRIGGER TBL0087_BI FOR TBL0087
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0087 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0088_BI
CREATE TRIGGER TBL0088_BI FOR TBL0088
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0088 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0089_BI
CREATE TRIGGER TBL0089_BI FOR TBL0089
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0089 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0090_BI
CREATE TRIGGER TBL0090_BI FOR TBL0090
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0090 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0091_BI
CREATE TRIGGER TBL0091_BI FOR TBL0091
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0091 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0092_BI
CREATE TRIGGER TBL0092_BI FOR TBL0092
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0092 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0093_BI
CREATE TRIGGER TBL0093_BI FOR TBL0093
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0093 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0094_BI
CREATE TRIGGER TBL0094_BI FOR TBL0094
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0094 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0095_BI
CREATE TRIGGER TBL0095_BI FOR TBL0095
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0095 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0096_BI
CREATE TRIGGER TBL0096_BI FOR TBL0096
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0096 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0097_BI
CREATE TRIGGER TBL0097_BI FOR TBL0097
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0097 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0098_BI
CREATE TRIGGER TBL0098_BI FOR TBL0098
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0098 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0099_BI
CREATE TRIGGER TBL0099_BI FOR TBL0099
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0099 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0100_BI
CREATE TRIGGER TBL0100_BI FOR TBL0100
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0100 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0101_BI
CREATE TRIGGER TBL0101_BI FOR TBL0101
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0101 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0102_BI
CREATE TRIGGER TBL0102_BI FOR TBL0102
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0102 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0103_BI
CREATE TRIGGER TBL0103_BI FOR TBL0103
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0103 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0104_BI
CREATE TRIGGER TBL0104_BI FOR TBL0104
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0104 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0105_BI
CREATE TRIGGER TBL0105_BI FOR TBL0105
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0105 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0106_BI
CREATE TRIGGER TBL0106_BI FOR TBL0106
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0106 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0107_BI
CREATE TRIGGER TBL0107_BI FOR TBL0107
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0107 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0108_BI
CREATE TRIGGER TBL0108_BI FOR TBL0108
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0108 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0109_BI
CREATE TRIGGER TBL0109_BI FOR TBL0109
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0109 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0110_BI
CREATE TRIGGER TBL0110_BI FOR TBL0110
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0110 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0111_BI
CREATE TRIGGER TBL0111_BI FOR TBL0111
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0111 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0112_BI
CREATE TRIGGER TBL0112_BI FOR TBL0112
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0112 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0113_BI
CREATE TRIGGER TBL0113_BI FOR TBL0113
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0113 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0114_BI
CREATE TRIGGER TBL0114_BI FOR TBL0114
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0114 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0115_BI
CREATE TRIGGER TBL0115_BI FOR TBL0115
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0115 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0116_BI
CREATE TRIGGER TBL0116_BI FOR TBL0116
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0116 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0117_BI
CREATE TRIGGER TBL0117_BI FOR TBL0117
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0117 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0118_BI
CREATE TRIGGER TBL0118_BI FOR TBL0118
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0118 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

-- TBL0119_BI
CREATE TRIGGER TBL0119_BI FOR TBL0119
ACTIVE BEFORE INSERT
AS
DECLARE VARIABLE TRY_COUNT INTEGER;
DECLARE VARIABLE MAX_ATTEMPTS INTEGER;
DECLARE VARIABLE GENERATED_UUID CHAR(36);
DECLARE VARIABLE ID_EXISTS INTEGER;
BEGIN
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());
      ID_EXISTS = 0;
      select coalesce(count(*),0) from TBL0119 where ID = :GENERATED_UUID into :ID_EXISTS;
      if (ID_EXISTS = 0) then
      begin
        new.ID = GENERATED_UUID;
        TRY_COUNT = 99 ;
      end
    end
    if ((TRY_COUNT >= MAX_ATTEMPTS) and (TRY_COUNT < 90)) then
    begin
      exception EX_UID_COLISAO;
    end
  end
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_CREATE;
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.DT_UPDATE;
  new.deleted = 0;
  if (new.ativo is null) then
    new.ativo = 0;
  if (new.user_create is null) then
    exception ex_user_nulo;
END^

SET TERM ; ^


-- #############################################
-- #          TRIGGERS BEFORE UPDATE           #
-- #############################################

SET TERM ^ ;

-- TBL0001_BU
CREATE TRIGGER TBL0001_BU FOR TBL0001
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0002_BU
CREATE TRIGGER TBL0002_BU FOR TBL0002
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0003_BU
CREATE TRIGGER TBL0003_BU FOR TBL0003
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0004_BU
CREATE TRIGGER TBL0004_BU FOR TBL0004
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0005_BU
CREATE TRIGGER TBL0005_BU FOR TBL0005
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0006_BU
CREATE TRIGGER TBL0006_BU FOR TBL0006
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0007_BU
CREATE TRIGGER TBL0007_BU FOR TBL0007
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0008_BU
CREATE TRIGGER TBL0008_BU FOR TBL0008
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0009_BU
CREATE TRIGGER TBL0009_BU FOR TBL0009
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0010_BU
CREATE TRIGGER TBL0010_BU FOR TBL0010
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0011_BU
CREATE TRIGGER TBL0011_BU FOR TBL0011
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0012_BU
CREATE TRIGGER TBL0012_BU FOR TBL0012
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0013_BU
CREATE TRIGGER TBL0013_BU FOR TBL0013
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0014_BU
CREATE TRIGGER TBL0014_BU FOR TBL0014
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0015_BU
CREATE TRIGGER TBL0015_BU FOR TBL0015
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0016_BU
CREATE TRIGGER TBL0016_BU FOR TBL0016
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0017_BU
CREATE TRIGGER TBL0017_BU FOR TBL0017
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0018_BU
CREATE TRIGGER TBL0018_BU FOR TBL0018
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0019_BU
CREATE TRIGGER TBL0019_BU FOR TBL0019
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0020_BU
CREATE TRIGGER TBL0020_BU FOR TBL0020
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0021_BU
CREATE TRIGGER TBL0021_BU FOR TBL0021
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0022_BU
CREATE TRIGGER TBL0022_BU FOR TBL0022
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0023_BU
CREATE TRIGGER TBL0023_BU FOR TBL0023
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0024_BU
CREATE TRIGGER TBL0024_BU FOR TBL0024
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0025_BU
CREATE TRIGGER TBL0025_BU FOR TBL0025
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0026_BU
CREATE TRIGGER TBL0026_BU FOR TBL0026
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0027_BU
CREATE TRIGGER TBL0027_BU FOR TBL0027
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0028_BU
CREATE TRIGGER TBL0028_BU FOR TBL0028
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0029_BU
CREATE TRIGGER TBL0029_BU FOR TBL0029
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0030_BU
CREATE TRIGGER TBL0030_BU FOR TBL0030
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0031_BU
CREATE TRIGGER TBL0031_BU FOR TBL0031
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0032_BU
CREATE TRIGGER TBL0032_BU FOR TBL0032
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0033_BU
CREATE TRIGGER TBL0033_BU FOR TBL0033
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0034_BU
CREATE TRIGGER TBL0034_BU FOR TBL0034
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0035_BU
CREATE TRIGGER TBL0035_BU FOR TBL0035
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0036_BU
CREATE TRIGGER TBL0036_BU FOR TBL0036
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0037_BU
CREATE TRIGGER TBL0037_BU FOR TBL0037
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0038_BU
CREATE TRIGGER TBL0038_BU FOR TBL0038
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0039_BU
CREATE TRIGGER TBL0039_BU FOR TBL0039
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0040_BU
CREATE TRIGGER TBL0040_BU FOR TBL0040
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0041_BU
CREATE TRIGGER TBL0041_BU FOR TBL0041
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0042_BU
CREATE TRIGGER TBL0042_BU FOR TBL0042
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0043_BU
CREATE TRIGGER TBL0043_BU FOR TBL0043
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0044_BU
CREATE TRIGGER TBL0044_BU FOR TBL0044
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0045_BU
CREATE TRIGGER TBL0045_BU FOR TBL0045
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0046_BU
CREATE TRIGGER TBL0046_BU FOR TBL0046
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0047_BU
CREATE TRIGGER TBL0047_BU FOR TBL0047
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0048_BU
CREATE TRIGGER TBL0048_BU FOR TBL0048
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0049_BU
CREATE TRIGGER TBL0049_BU FOR TBL0049
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0050_BU
CREATE TRIGGER TBL0050_BU FOR TBL0050
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0051_BU
CREATE TRIGGER TBL0051_BU FOR TBL0051
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0052_BU
CREATE TRIGGER TBL0052_BU FOR TBL0052
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0053_BU
CREATE TRIGGER TBL0053_BU FOR TBL0053
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0054_BU
CREATE TRIGGER TBL0054_BU FOR TBL0054
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0055_BU
CREATE TRIGGER TBL0055_BU FOR TBL0055
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0056_BU
CREATE TRIGGER TBL0056_BU FOR TBL0056
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0057_BU
CREATE TRIGGER TBL0057_BU FOR TBL0057
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0058_BU
CREATE TRIGGER TBL0058_BU FOR TBL0058
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0059_BU
CREATE TRIGGER TBL0059_BU FOR TBL0059
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0060_BU
CREATE TRIGGER TBL0060_BU FOR TBL0060
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0061_BU
CREATE TRIGGER TBL0061_BU FOR TBL0061
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0062_BU
CREATE TRIGGER TBL0062_BU FOR TBL0062
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0063_BU
CREATE TRIGGER TBL0063_BU FOR TBL0063
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0064_BU
CREATE TRIGGER TBL0064_BU FOR TBL0064
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0065_BU
CREATE TRIGGER TBL0065_BU FOR TBL0065
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0066_BU
CREATE TRIGGER TBL0066_BU FOR TBL0066
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0067_BU
CREATE TRIGGER TBL0067_BU FOR TBL0067
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0068_BU
CREATE TRIGGER TBL0068_BU FOR TBL0068
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0069_BU
CREATE TRIGGER TBL0069_BU FOR TBL0069
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0070_BU
CREATE TRIGGER TBL0070_BU FOR TBL0070
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0071_BU
CREATE TRIGGER TBL0071_BU FOR TBL0071
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0072_BU
CREATE TRIGGER TBL0072_BU FOR TBL0072
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0073_BU
CREATE TRIGGER TBL0073_BU FOR TBL0073
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0074_BU
CREATE TRIGGER TBL0074_BU FOR TBL0074
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0075_BU
CREATE TRIGGER TBL0075_BU FOR TBL0075
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0076_BU
CREATE TRIGGER TBL0076_BU FOR TBL0076
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0077_BU
CREATE TRIGGER TBL0077_BU FOR TBL0077
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0078_BU
CREATE TRIGGER TBL0078_BU FOR TBL0078
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0079_BU
CREATE TRIGGER TBL0079_BU FOR TBL0079
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0080_BU
CREATE TRIGGER TBL0080_BU FOR TBL0080
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0081_BU
CREATE TRIGGER TBL0081_BU FOR TBL0081
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0082_BU
CREATE TRIGGER TBL0082_BU FOR TBL0082
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0083_BU
CREATE TRIGGER TBL0083_BU FOR TBL0083
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0084_BU
CREATE TRIGGER TBL0084_BU FOR TBL0084
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0085_BU
CREATE TRIGGER TBL0085_BU FOR TBL0085
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0086_BU
CREATE TRIGGER TBL0086_BU FOR TBL0086
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0087_BU
CREATE TRIGGER TBL0087_BU FOR TBL0087
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0088_BU
CREATE TRIGGER TBL0088_BU FOR TBL0088
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0089_BU
CREATE TRIGGER TBL0089_BU FOR TBL0089
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0090_BU
CREATE TRIGGER TBL0090_BU FOR TBL0090
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0091_BU
CREATE TRIGGER TBL0091_BU FOR TBL0091
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0092_BU
CREATE TRIGGER TBL0092_BU FOR TBL0092
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0093_BU
CREATE TRIGGER TBL0093_BU FOR TBL0093
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0094_BU
CREATE TRIGGER TBL0094_BU FOR TBL0094
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0095_BU
CREATE TRIGGER TBL0095_BU FOR TBL0095
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

SET TERM ^ ;

-- TBL0096_BU
CREATE TRIGGER TBL0096_BU FOR TBL0096
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0097_BU
CREATE TRIGGER TBL0097_BU FOR TBL0097
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0098_BU
CREATE TRIGGER TBL0098_BU FOR TBL0098
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0099_BU
CREATE TRIGGER TBL0099_BU FOR TBL0099
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0100_BU
CREATE TRIGGER TBL0100_BU FOR TBL0100
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0101_BU
CREATE TRIGGER TBL0101_BU FOR TBL0101
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0102_BU
CREATE TRIGGER TBL0102_BU FOR TBL0102
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0103_BU
CREATE TRIGGER TBL0103_BU FOR TBL0103
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0104_BU
CREATE TRIGGER TBL0104_BU FOR TBL0104
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0105_BU
CREATE TRIGGER TBL0105_BU FOR TBL0105
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0106_BU
CREATE TRIGGER TBL0106_BU FOR TBL0106
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0107_BU
CREATE TRIGGER TBL0107_BU FOR TBL0107
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0108_BU
CREATE TRIGGER TBL0108_BU FOR TBL0108
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0109_BU
CREATE TRIGGER TBL0109_BU FOR TBL0109
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0110_BU
CREATE TRIGGER TBL0110_BU FOR TBL0110
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0111_BU
CREATE TRIGGER TBL0111_BU FOR TBL0111
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0112_BU
CREATE TRIGGER TBL0112_BU FOR TBL0112
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0113_BU
CREATE TRIGGER TBL0113_BU FOR TBL0113
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0114_BU
CREATE TRIGGER TBL0114_BU FOR TBL0114
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0115_BU
CREATE TRIGGER TBL0115_BU FOR TBL0115
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0116_BU
CREATE TRIGGER TBL0116_BU FOR TBL0116
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0117_BU
CREATE TRIGGER TBL0117_BU FOR TBL0117
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0118_BU
CREATE TRIGGER TBL0118_BU FOR TBL0118
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

-- TBL0119_BU
CREATE TRIGGER TBL0119_BU FOR TBL0119
ACTIVE BEFORE UPDATE
AS
BEGIN
  if ((new.DELETED = 1) and (old.DELETED = 1)) then
  begin
    exception EX_UPDATE_REG_DEL;
  end
  if (new.DELETED = 0) then
  begin
    if (new.USER_UPDATE is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_UPDATE;
  end
  if ((new.DELETED = 1) and (old.DELETED = 0)) then
  begin
    if (new.USER_DELETED is null) then
      exception EX_USER_NULO;
    select current_timestamp from RDB$DATABASE into new.DT_DELETED;
  end
END^

SET TERM ; ^

COMMIT;