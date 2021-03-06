USE Tantra;
CREATE TABLE GMInfo(
	GMID char(20) NOT NULL,
	GMPassword char(20) NOT NULL,
	GMName char(20) NOT NULL,
	GMLevel int NOT NULL,
	GMPart char(30) NOT NULL,
	
	PRIMARY KEY(GMID)
);

CREATE TABLE GMLog(
	LogIndex int IDENTITY(1,1) NOT NULL,
	GMID char(20) NOT NULL,
	SaveDate datetime NOT NULL,
	Description varchar(2048) NOT NULL,
	
	PRIMARY KEY(LogIndex)
);

CREATE TABLE TantraItem(
	World int NOT NULL,
	Account varchar(20) NOT NULL,
	ItemIndex bigint NOT NULL,
	ItemCount int NOT NULL
);

CREATE TABLE TantraItem_historico(
	Mundo int NULL,
	Account varchar(20) NULL,
	ItemIndex bigint NULL,
	ItemCount int NULL,
	Fecha datetime NULL
);

CREATE TABLE TantraMail(
	ID int IDENTITY(1,1) NOT NULL,
	Account varchar(20) NOT NULL,
	Content varchar(256) NOT NULL,
	
	PRIMARY KEY(ID)
);

CREATE TABLE TantraBackup00(
	idx int IDENTITY(1,1) NOT NULL,
	UserID varchar(20) NOT NULL,
	CharacterName varchar(20) NOT NULL,
	CharacterLevel smallint NOT NULL,
	BrahmanPoint int NULL,
	MBrahmanPoint int NULL,
	Tribe smallint NOT NULL,
	Trimurity smallint NOT NULL,
	GuildName varchar(20) NULL,
	GuildID int NULL,
	GuildRank smallint NOT NULL,
	curtime datetime NOT NULL,
	Name1 varchar(20) NULL,
	Name2 varchar(20) NULL,
	Name3 varchar(20) NULL,
	Level1 smallint NOT NULL,
	Level2 smallint NOT NULL,
	Level3 smallint NOT NULL,
	TotalMoney float NOT NULL,
	Blocked tinyint NOT NULL,
	Account binary(7124) NULL,
	
	PRIMARY KEY(idx,UserID)
);

CREATE TABLE GameInfo00(
	UserID varchar(20) NOT NULL,
	CharacterName varchar(20) NOT NULL,
	CharacterLevel smallint NOT NULL,
	BrahmanPoint int NOT NULL,
	MBrahmanPoint int NOT NULL,
	Tribe smallint NOT NULL,
	Trimurity smallint NOT NULL,
	GuildName varchar(20) NULL,
	GuildID int NULL,
	GuildRank smallint NOT NULL,
	curtime datetime NOT NULL,
	Name1 varchar(20) NULL,
	Name2 varchar(20) NULL,
	Name3 varchar(20) NULL,
	Level1 smallint NOT NULL,
	Level2 smallint NOT NULL,
	Level3 smallint NOT NULL,
	TotalMoney float NOT NULL,
	
	PRIMARY KEY(UserID)
);

GO
CREATE TRIGGER UpdateRank
    ON TantraBackup00
    AFTER INSERT,UPDATE,DELETE
AS
    BEGIN
        DELETE FROM GameInfo00
        INSERT INTO GameInfo00
        SELECT
            UserID,
            CharacterName,
            CharacterLevel,
            BrahmanPoint,
            MBrahmanPoint,
            Tribe,
            Trimurity,
            GuildName,
            GuildID,
            GuildRank,
            curtime,
            Name1,
            Name2,
            Name3,
            Level1,
            Level2,
            Level3,
            TotalMoney
        FROM TantraBackup00
    END
GO
