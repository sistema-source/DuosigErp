
SET SQL DIALECT 3;





CREATE TABLE MIGRATIONS (
    ID              CHAR(36) NOT NULL,
    NOME_MIGRATION  VARCHAR(255),
    EXECUTADA_EM    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);





ALTER TABLE MIGRATIONS ADD CONSTRAINT PK_MIGRATIONS PRIMARY KEY (ID);




SET TERM ^ ;






/* Trigger: MIGRATIONS_BI0 */
CREATE TRIGGER MIGRATIONS_BI0 FOR MIGRATIONS
ACTIVE BEFORE INSERT POSITION 0
as
declare variable TRY_COUNT integer;
declare variable MAX_ATTEMPTS integer;
declare variable GENERATED_UUID char(36);
declare variable ID_EXISTS integer;

begin
  TRY_COUNT = 0;
  MAX_ATTEMPTS = 5;
  if (new.ID is null) then
  begin
    -- Repete até encontrar um UUID único (colisão é improvável, mas trata o caso)
    while (TRY_COUNT < MAX_ATTEMPTS) do
    begin
      TRY_COUNT = TRY_COUNT + 1;
      GENERATED_UUID = UUID_TO_CHAR(GEN_UUID());

      ID_EXISTS = 0;

      select coalesce(count(*),0)
      from MIGRATIONS
      where ID = :GENERATED_UUID
      into :ID_EXISTS;

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

  -- Atribuiir as datas
  SELECT current_timestamp FROM RDB$DATABASE INTO NEW.EXECUTADA_EM;




end
^


SET TERM ; ^



