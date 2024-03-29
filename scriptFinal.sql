﻿IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

CREATE TABLE [Personagens] (
    [Id] int NOT NULL IDENTITY,
    [Nome] nvarchar(max) NULL,
    [PontosVida] int NOT NULL,
    [Forca] int NOT NULL,
    [Defesa] int NOT NULL,
    [Inteligencia] int NOT NULL,
    [Classe] int NOT NULL,
    CONSTRAINT [PK_Personagens] PRIMARY KEY ([Id])
);
GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Classe', N'Defesa', N'Forca', N'Inteligencia', N'Nome', N'PontosVida') AND [object_id] = OBJECT_ID(N'[Personagens]'))
    SET IDENTITY_INSERT [Personagens] ON;
INSERT INTO [Personagens] ([Id], [Classe], [Defesa], [Forca], [Inteligencia], [Nome], [PontosVida])
VALUES (1, 1, 23, 17, 33, N'Frodo', 100),
(2, 1, 25, 15, 30, N'Sam', 100),
(3, 3, 21, 18, 35, N'Galadriel', 100),
(4, 2, 18, 18, 37, N'Gandalf', 100),
(5, 1, 17, 20, 31, N'Hobbit', 100),
(6, 3, 13, 21, 34, N'Celeborn', 100),
(7, 2, 11, 25, 35, N'Radagast', 100);
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Classe', N'Defesa', N'Forca', N'Inteligencia', N'Nome', N'PontosVida') AND [object_id] = OBJECT_ID(N'[Personagens]'))
    SET IDENTITY_INSERT [Personagens] OFF;
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220324143634_InitialCreate', N'5.0.15');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

ALTER TABLE [Personagens] ADD [FotoPersonagem] varbinary(max) NULL;
GO

ALTER TABLE [Personagens] ADD [UsuarioId] int NULL;
GO

CREATE TABLE [Armas] (
    [Id] int NOT NULL IDENTITY,
    [Nome] nvarchar(max) NULL,
    [Dano] int NOT NULL,
    CONSTRAINT [PK_Armas] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [Usuarios] (
    [Id] int NOT NULL IDENTITY,
    [Username] nvarchar(max) NULL,
    [PasswordHash] varbinary(max) NULL,
    [PasswordSalt] varbinary(max) NULL,
    [Foto] varbinary(max) NULL,
    [Latitude] nvarchar(max) NULL,
    [Longitude] nvarchar(max) NULL,
    [DataAcesso] datetime2 NULL,
    CONSTRAINT [PK_Usuarios] PRIMARY KEY ([Id])
);
GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'DataAcesso', N'Foto', N'Latitude', N'Longitude', N'PasswordHash', N'PasswordSalt', N'Username') AND [object_id] = OBJECT_ID(N'[Usuarios]'))
    SET IDENTITY_INSERT [Usuarios] ON;
INSERT INTO [Usuarios] ([Id], [DataAcesso], [Foto], [Latitude], [Longitude], [PasswordHash], [PasswordSalt], [Username])
VALUES (1, NULL, NULL, NULL, NULL, 0xFAEBAAE612A0277D07A9ED5057BF8017C48759FEB0AFE7EE079737237E0C09D23DEB1DDE4B6282942DA42BC9D0B67D9D9D62BB1CE05E7F393C5AF9DDA3E68CD6, 0x08F337A648FEFF42C2498A248853B9FF1C4B71220803C0492C892C7D50DBF1A58D97697238352DEDC7426B324098F2BC52F8FEAEE078A29F88CCAAD1129FE3AE83B31E34012F99A0207C6A53FD7D463672DA4A5F6F594744D6A7C183447C9875ACD9C7EB30703FF7BD265EE28FB9661418A1BD95F227CD035FDAD4E0D2504414, NULL);
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'DataAcesso', N'Foto', N'Latitude', N'Longitude', N'PasswordHash', N'PasswordSalt', N'Username') AND [object_id] = OBJECT_ID(N'[Usuarios]'))
    SET IDENTITY_INSERT [Usuarios] OFF;
GO

CREATE INDEX [IX_Personagens_UsuarioId] ON [Personagens] ([UsuarioId]);
GO

ALTER TABLE [Personagens] ADD CONSTRAINT [FK_Personagens_Usuarios_UsuarioId] FOREIGN KEY ([UsuarioId]) REFERENCES [Usuarios] ([Id]) ON DELETE NO ACTION;
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220406150622_MigracaoUsuario', N'5.0.15');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

ALTER TABLE [Armas] ADD [PersonagemId] int NOT NULL DEFAULT 0;
GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Dano', N'Nome', N'PersonagemId') AND [object_id] = OBJECT_ID(N'[Armas]'))
    SET IDENTITY_INSERT [Armas] ON;
INSERT INTO [Armas] ([Id], [Dano], [Nome], [PersonagemId])
VALUES (1, 35, N'Arco e Flecha', 1),
(2, 33, N'Espada', 2),
(3, 31, N'Machado', 3);
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Dano', N'Nome', N'PersonagemId') AND [object_id] = OBJECT_ID(N'[Armas]'))
    SET IDENTITY_INSERT [Armas] OFF;
GO

UPDATE [Usuarios] SET [PasswordHash] = 0x521A4CB3C0388335B443D3B9B971E96404A1D0D86A0FDBF9E4CA797401ADA6ADB13A361288088267AD4944F11C6B5CB0CE4292C601488F38510F0D2DC2E8EF08, [PasswordSalt] = 0xDEB557F6D6AE4BBF5F8CA232F027141CE9373A47F4925BF966CDCD0D5D1B18E1DE1351B1BA685330B0E956E976C38AE8082324D63D30B6C51C5030A3AD25DC7FB43A827BE42DFD66981030C62F6645E4A7D4957A89EEBE1B651B557C3785C58EA9B57E4248E37F26A2BC81A3A906BD994C6934610AB2095966B0EEE16581EACA
WHERE [Id] = 1;
SELECT @@ROWCOUNT;

GO

CREATE UNIQUE INDEX [IX_Armas_PersonagemId] ON [Armas] ([PersonagemId]);
GO

ALTER TABLE [Armas] ADD CONSTRAINT [FK_Armas_Personagens_PersonagemId] FOREIGN KEY ([PersonagemId]) REFERENCES [Personagens] ([Id]) ON DELETE CASCADE;
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220406153523_MigracaoUmParaUm', N'5.0.15');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

CREATE TABLE [Habilidades] (
    [Id] int NOT NULL IDENTITY,
    [Nome] nvarchar(max) NULL,
    [Dano] int NOT NULL,
    CONSTRAINT [PK_Habilidades] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [PersonagemHabilidades] (
    [PersonagemId] int NOT NULL,
    [HabilidadeId] int NOT NULL,
    CONSTRAINT [PK_PersonagemHabilidades] PRIMARY KEY ([PersonagemId], [HabilidadeId]),
    CONSTRAINT [FK_PersonagemHabilidades_Habilidades_HabilidadeId] FOREIGN KEY ([HabilidadeId]) REFERENCES [Habilidades] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_PersonagemHabilidades_Personagens_PersonagemId] FOREIGN KEY ([PersonagemId]) REFERENCES [Personagens] ([Id]) ON DELETE CASCADE
);
GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Dano', N'Nome') AND [object_id] = OBJECT_ID(N'[Habilidades]'))
    SET IDENTITY_INSERT [Habilidades] ON;
INSERT INTO [Habilidades] ([Id], [Dano], [Nome])
VALUES (1, 39, N'Adormecer'),
(2, 41, N'Congelar'),
(3, 37, N'Hipnotizar');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Dano', N'Nome') AND [object_id] = OBJECT_ID(N'[Habilidades]'))
    SET IDENTITY_INSERT [Habilidades] OFF;
GO

UPDATE [Usuarios] SET [PasswordHash] = 0x03A13A9439F323129EBF06D95F77725A61FADF269072FE8D9C8957D600D501A76879C3F8CCDDFBD8CD275F189092B95E0FD9E69EC45D788DD168378F7D28FAF5, [PasswordSalt] = 0xB9627F17E220479077ACBBA68BE1D5C4488F112D0C2B7FB928D369B95B9191E540AE3005129F5C306E5DAA2343107872E470919736BFC27C17B074B7F31C1B04341B79F0F6E3FB185F74C0B4C95622CA5EE10A521F3A4D2BDF082996357C3270956DAA02F42AF608119BBB0B5B7AA33E81CCA28016A7CD3983B471ED6888388B
WHERE [Id] = 1;
SELECT @@ROWCOUNT;

GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'HabilidadeId', N'PersonagemId') AND [object_id] = OBJECT_ID(N'[PersonagemHabilidades]'))
    SET IDENTITY_INSERT [PersonagemHabilidades] ON;
INSERT INTO [PersonagemHabilidades] ([HabilidadeId], [PersonagemId])
VALUES (1, 1),
(1, 5),
(2, 1),
(2, 2),
(2, 3),
(2, 6),
(3, 3),
(3, 4),
(3, 7);
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'HabilidadeId', N'PersonagemId') AND [object_id] = OBJECT_ID(N'[PersonagemHabilidades]'))
    SET IDENTITY_INSERT [PersonagemHabilidades] OFF;
GO

CREATE INDEX [IX_PersonagemHabilidades_HabilidadeId] ON [PersonagemHabilidades] ([HabilidadeId]);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220406155242_MigracaoMuitosParaMuitos', N'5.0.15');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

ALTER TABLE [Usuarios] ADD [Perfil] nvarchar(max) NOT NULL DEFAULT N'Jogador';
GO

UPDATE [Usuarios] SET [PasswordHash] = 0xF874AAA2F7CCBCD2CA3330B910054AA64B04289B3293CF0D448AF56BD83847C7BDE2C30DE5C8DCB3F24BD6219A41D9286E891852C9F3DF7C80E64328B0E66E7D, [PasswordSalt] = 0xCBD7C0946CD51EABA79313EF0348CD7612B566448FA7BFF664A09B9E2230980000181173A3BCD5C5C3042CEAF35E90FCC54EBF70B5D038EBE8F28C7897C84CE0E5CDBACC3A25AE37D950BA4F379E03C62E3E7F2FD8D76A8FA741A3871AC97FACDC169A2743664D5AEBC5A99C9EFFE05E8559EB0C37AA41AA69EC872041BA2B2B, [Username] = N'UsuarioAdmin'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220506005040_MigracaoPerfil', N'5.0.15');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

DECLARE @var0 sysname;
SELECT @var0 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Usuarios]') AND [c].[name] = N'Perfil');
IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [Usuarios] DROP CONSTRAINT [' + @var0 + '];');
ALTER TABLE [Usuarios] ALTER COLUMN [Perfil] nvarchar(max) NULL;
ALTER TABLE [Usuarios] ADD DEFAULT N'Jogador' FOR [Perfil];
GO

ALTER TABLE [Usuarios] ADD [Email] nvarchar(max) NULL;
GO

ALTER TABLE [Personagens] ADD [Derrotas] int NOT NULL DEFAULT 0;
GO

ALTER TABLE [Personagens] ADD [Disputas] int NOT NULL DEFAULT 0;
GO

ALTER TABLE [Personagens] ADD [Vitorias] int NOT NULL DEFAULT 0;
GO

CREATE TABLE [Disputas] (
    [Id] int NOT NULL IDENTITY,
    [DataDisputa] datetime2 NULL,
    [AtacanteId] int NOT NULL,
    [OponenteId] int NOT NULL,
    [Narracao] nvarchar(max) NULL,
    CONSTRAINT [PK_Disputas] PRIMARY KEY ([Id])
);
GO

UPDATE [Usuarios] SET [PasswordHash] = 0x50A365F4D3885648F9D6739377D1947D7A8F2D7B5DE1F235C6B3C5604834CFEE7FE087708601841EC67B4BE59338339721E63F7E0726D79971F344B7DE2E3820, [PasswordSalt] = 0x23440EFA5FBC16FC8F09AA66A0AB421F246CBBA748495E6D35A13EB3BD1EB118D71589E1F694840A2A6261FAF5551EB2FFBEBD4691657470A7F53A6C70231F9C08E271F4E5ECEA338A6A1918F5F59F2657F8C4317B418659AE83A5D4D5562DCF605B0E065B1E2830AF23AF16F9A7A68AD2A62560041639524431DC2593C0DF5A
WHERE [Id] = 1;
SELECT @@ROWCOUNT;

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220512233754_MigracaoDisputas', N'5.0.15');
GO

COMMIT;
GO

