DEFINE USER_NAME = &&1
DEFINE TABLESPACE_NAME = "&&USER_NAME._DATA"
DEFINE TABLESPACE_INDEX = "&&USER_NAME._INDEX"

SET SERVEROUTPUT ON

CREATE TABLE BOX ( 
  BOX_ID NUMBER GENERATED ALWAYS AS IDENTITY INCREMENT BY 1 NOT NULL ,
  WEIGHT NUMBER(10,5) NOT NULL,
  TYPE VARCHAR(500) NOT NULL,
  PRICE NUMBER(10,5),
  COUNT INT NOT NULL,
  PRODUCT_ID INT NOT NULL,
  CONSTRAINT PK_BOX PRIMARY KEY (BOX_ID)
  USING INDEX (
      CREATE UNIQUE INDEX BOX_PK ON BOX (BOX_ID ASC)
	  TABLESPACE &&TABLESPACE_INDEX
  ),
  CONSTRAINT BOX_FK
    FOREIGN KEY (PRODUCT_ID)
    REFERENCES PRODUCT(PRODUCT_ID)
)
TABLESPACE &&TABLESPACE_NAME;

CREATE INDEX FK_BOX_PRODUCT_ID ON BOX(PRODUCT_ID ASC);

COMMENT ON COLUMN BOX.BOX_ID IS 'Unique identifier';
COMMENT ON COLUMN BOX.WEIGHT IS 'Weight of box';
COMMENT ON COLUMN BOX.TYPE IS 'Type of box (��� �������, ��� ���������������)';
COMMENT ON COLUMN BOX.PRICE IS 'Price of whole box';
COMMENT ON COLUMN BOX.COUNT IS 'Amount of product in box';
COMMENT ON COLUMN BOX.PRODUCT_ID IS 'Unique identifier of product';

SET SERVEROUTPUT OFF

UNDEFINE USER_NAME
UNDEFINE TABLESPACE_NAME
UNDEFINE TABLESPACE_INDEX