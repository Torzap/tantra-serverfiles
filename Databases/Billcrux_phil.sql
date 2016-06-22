/* 

	Billcrux_phil DB Query by Amir Torrez -> amirtorrez@openmailbox.org 

*/

USE Billcrux_phil;

CREATE TABLE tblUserInfo(
	userNumber int NOT NULL,
	userId nvarchar(52) NOT NULL,
	userPwd nvarchar(70) NULL,
	userKey nvarchar(7) NULL,
	cpId int NOT NULL,
	userSurName nvarchar(64) NULL,
	MI nvarchar(1) NULL,
	userFirstName nvarchar(64) NULL,
	userTypeId tinyint NULL,
	userStatusId tinyint NULL,
	gameServiceId smallint NULL,
	ssno nchar(13) NULL,
	sex bit NULL,
	birthday smalldatetime NULL,
	isSolar bit NULL,
	email nvarchar(64) NULL,
	zipcode nchar(6) NULL,
	nation nvarchar(64) NULL,
	address nvarchar(256) NULL,
	city char(50) NULL,
	state nvarchar(50) NULL,
	phoneNumber nvarchar(33) NULL,
	passwordCheckQuestionTypeId nvarchar(64) NULL,
	passwordCheckAnswer nvarchar(64) NULL,
	cashBalance int NULL,
	pointToCashBalance int NULL,
	holdCashBalance int NULL,
	pointBalance int NULL,
	registDt datetime NULL,
	apply tinyint NULL CONSTRAINT DF_tblUserInfo_apply  DEFAULT ((0)),
	
	PRIMARY KEY(userNumber,UserId)
);

GO
CREATE TRIGGER AccountCash
	ON tblUserInfo
	AFTER INSERT
AS
	BEGIN
		INSERT INTO tblUserInfo (userNumber,userId,cashBalance)
		SELECT 
			ID,
			UserID,
			cashBalance = 0
		FROM UserLogin.dbo.Account
	END
GO

/*  
	DELETE TRIGGER:

DROP TRIGGER Account Cash;
 
 */
