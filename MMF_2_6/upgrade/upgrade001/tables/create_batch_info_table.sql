DEFINE USER_NAME = &&1
DEFINE TABLESPACE_NAME = "&&USER_NAME._DATA"
DEFINE TABLESPACE_INDEX = "&&USER_NAME._INDEX"

SET SERVEROUTPUT ON

CREATE TABLE BATCH_INFO ( 
  BATCH_ID NUMBER NOT NULL,
  BOX_ID INT NOT NULL,
  CONSTRAINT PK_BATCH_INFO PRIMARY KEY (BATCH_ID, BOX_ID)
  USING INDEX (
      CREATE UNIQUE INDEX BATCH_INFO_PK ON BATCH_INFO (BATCH_ID ASC, BOX_ID)
	  TABLESPACE &&TABLESPACE_INDEX
  ),
  CONSTRAINT BATCH_INFO_FK1
    FOREIGN KEY (BATCH_ID)
    REFERENCES BATCH(BATCH_ID),
  CONSTRAINT BATCH_INFO_FK2
    FOREIGN KEY (BOX_ID)
    REFERENCES BOX(BOX_ID)
)

TABLESPACE &&TABLESPACE_NAME;

CREATE INDEX FK_BATCH_INFO_BATCH ON BATCH_INFO(BATCH_ID ASC) TABLESPACE &&TABLESPACE_INDEX;
CREATE INDEX FK_BATCH_INFO_BOX ON BATCH_INFO(BOX_ID ASC) TABLESPACE &&TABLESPACE_INDEX;

COMMENT ON COLUMN BATCH_INFO.BATCH_ID IS 'Unique identifier of batch';
COMMENT ON COLUMN BATCH_INFO.BOX_ID IS 'Unique identifier of box';

SET SERVEROUTPUT OFF

UNDEFINE USER_NAME
UNDEFINE TABLESPACE_NAME
UNDEFINE TABLESPACE_INDEX