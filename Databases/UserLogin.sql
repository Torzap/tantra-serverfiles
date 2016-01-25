/* 

	UserLogin DB Query by Amir Torrez -> amirtorrez@openmailbox.org 

*/

USE UserLogin;

CREATE TABLE Account (
	ID int IDENTITY(1,1) NOT NULL,
	Email varchar(50) NOT NULL,
	UserID varchar(50) NOT NULL,
	Password varchar(70) NOT NULL,
	UserKey varchar(7) NOT NULL,
	Blocked tinyint NOT NULL,
	BlockedDate datetime NULL,
	BlockedEndDate datetime NULL,
	UnBlockedDate datetime NULL,
	SecretQuestion varchar(50) NULL,
	Answer varchar(50) NULL,
	Firstname varchar(30) NULL,
	MI varchar(1) NOT NULL,
	Lastname varchar(30) NULL,
	Birthday datetime NULL,
	Sex tinyint NULL,
	Address varchar(100) NULL,
	City varchar(50) NULL,
	State varchar(50) NULL,
	Country varchar(50) NULL,
	MobileNo varchar(100) NULL,
	HomeNo varchar(100) NULL,
	WherePlay varchar(100) NULL,
	InternetCon varchar(100) NULL,
	ISPCafe varchar(100) NULL,
	MMORPG varchar(500) NULL,
	PowerChar varchar(500) NULL,
	PrevExp varchar(500) NULL,
	AboutTantra varchar(100) NULL,
	RegIPAddress varchar(15) NULL,
	ActivationKey uniqueidentifier NULL,
	DateRegistered datetime NULL,
	Activated bit NULL,
	SMSReg bit NULL,
	CloseBeta int NULL,
	Vote tinyint NULL,
	CreditCardPaymentErrorCount tinyint NOT NULL,
	LastCreditCardPaymentErrorDate datetime NULL,
	Confirmed smallint NOT NULL,
	AllowCreditCard bit NULL,
	School varchar(50) NULL,
	SpamMail tinyint NULL,
	RejectMail tinyint NULL,
	UnsubsMail bit NULL,
	SecretCode varchar(7) NULL,
	IsUserCreated bit NOT NULL,
	
	PRIMARY KEY(ID,UserID)
);

CREATE TABLE CloseBeta (
	ID int NOT NULL,
	Email varchar(50) NOT NULL,
	UserID varchar(50) NOT NULL,
	Password varchar(70) NOT NULL,
	UserKey varchar(7) NOT NULL,
	SecretCode varchar(7) NULL,
	
	PRIMARY KEY(ID,UserID)
);

GO
CREATE TRIGGER BetaAccount
	ON CloseBeta
	AFTER INSERT
AS
	BEGIN
		INSERT INTO CloseBeta SELECT ID, Email, UserID, Password, UserKey, SecretCode FROM Account WHERE Activated = 1 AND CloseBeta = 1;
		UPDATE Account SET CloseBeta = 0 WHERE Activated = 1;
	END
GO;

/*  
	DELETE TRIGGER AND DB:

DROP TRIGGER BetaAccount;
DROP TABLE CloseBeta;
 
 */
