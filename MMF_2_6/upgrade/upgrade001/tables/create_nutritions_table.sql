DEFINE USER_NAME = &&1
DEFINE TABLESPACE_NAME = "&&USER_NAME._DATA"
DEFINE TABLESPACE_INDEX = "&&USER_NAME._INDEX"

SET SERVEROUTPUT ON

CREATE TABLE NUTRITIONS ( 
  ID NUMBER GENERATED ALWAYS AS IDENTITY INCREMENT BY 1 NOT NULL ,
  FATS NUMBER(10,5),
  PROTEINS NUMBER(10,5),
  CARBOHYDRATES NUMBER(10,5),
  COCOA NUMBER(10,5),
  PRODUCT_ID INT NOT NULL,
  CONSTRAINT PK_NUTRITIONS PRIMARY KEY (ID)
  USING INDEX (
      CREATE UNIQUE INDEX NUTRITIONS_PK ON NUTRITIONS (ID ASC)
	  TABLESPACE &&TABLESPACE_INDEX
  ),
  CONSTRAINT NUTRITIONS_FK
    FOREIGN KEY (PRODUCT_ID)
    REFERENCES PRODUCT(PRODUCT_ID)
)
TABLESPACE &&TABLESPACE_NAME;

CREATE INDEX FK_NUTRITIONS_PRODUCT_ID ON NUTRITIONS(PRODUCT_ID ASC);

COMMENT ON COLUMN NUTRITIONS.ID IS 'Unique identifier';
COMMENT ON COLUMN NUTRITIONS.FATS IS 'Fats';
COMMENT ON COLUMN NUTRITIONS.PROTEINS IS 'Proteins';
COMMENT ON COLUMN NUTRITIONS.CARBOHYDRATES IS 'Carbohydrates';
COMMENT ON COLUMN NUTRITIONS.COCOA IS 'Cocoa percentage';
COMMENT ON COLUMN NUTRITIONS.PRODUCT_ID IS 'Unique identifier of product';

SET SERVEROUTPUT OFF

UNDEFINE USER_NAME
UNDEFINE TABLESPACE_NAME
UNDEFINE TABLESPACE_INDEX