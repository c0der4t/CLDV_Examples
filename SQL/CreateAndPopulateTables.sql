USE SampleDB;

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login](
	[ID] [int] IDENTITY(0,1) NOT NULL,
	[username] [ntext] NOT NULL,
	[password] [ntext] NOT NULL,
	[isAdmin] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[login] ADD PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[login] ADD  DEFAULT ((0)) FOR [isAdmin]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestImg](
	[ID] [int] IDENTITY(0,1) NOT NULL,
	[RowName] [varchar](255) NOT NULL,
	[RowInfo] [varchar](255) NULL,
	[Image] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[TestImg] ADD PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TestImg] ADD  DEFAULT ('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') FOR [Image]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test2](
	[ID] [int] IDENTITY(0,1) NOT NULL,
	[RowName] [varchar](255) NOT NULL,
	[RowInfo] [varchar](255) NULL,
	[image] [varchar](255) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Test2] ADD PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

INSERT INTO Test2 ("RowName","RowInfo") VALUES ('The Great Gatsby', 'A classic novel depicting the Jazz Age.');
INSERT INTO Test2 ("RowName","RowInfo") VALUES ('To Kill a Mockingbird', 'A poignant story tackling racial injustice in the American South.');
INSERT INTO Test2 ("RowName","RowInfo") VALUES ('1984', 'A dystopian masterpiece exploring totalitarianism and surveillance.');
INSERT INTO Test2 ("RowName","RowInfo") VALUES ('Pride and Prejudice', 'A timeless romance set in Regency-era England.');
INSERT INTO Test2 ("RowName","RowInfo") VALUES ('The Catcher in the Rye', 'A coming-of-age novel capturing teenage angst and rebellion.');
INSERT INTO Test2 ("RowName","RowInfo") VALUES ('The Lord of the Rings', 'An epic fantasy saga chronicling the journey to destroy the One Ring.');
INSERT INTO Test2 ("RowName","RowInfo") VALUES ('Harry Potter and the Sorcerers Stone', 'The first book in the beloved series about a young wizard.');
INSERT INTO Test2 ("RowName","RowInfo") VALUES ('To the Lighthouse', 'A modernist novel exploring themes of perception and subjectivity.');
INSERT INTO Test2 ("RowName","RowInfo") VALUES ('Moby-Dick', 'An epic tale of obsession and revenge set against the backdrop of whaling.');
INSERT INTO Test2 ("RowName","RowInfo") VALUES ('The Hobbit', 'A charming adventure about a hobbit embarking on a quest.');
INSERT INTO Test2 ("RowName","RowInfo") VALUES ('Brave New World', 'A speculative fiction novel envisioning a dystopian society driven by technology and hedonism.');
INSERT INTO Test2 ("RowName","RowInfo") VALUES ('Wuthering Heights', 'A dark and passionate tale of love and revenge on the Yorkshire moors.');
INSERT INTO Test2 ("RowName","RowInfo") VALUES ('The Picture of Dorian Gray', 'A Gothic novel exploring the nature of vanity and moral corruption.');
INSERT INTO Test2 ("RowName","RowInfo") VALUES ('The Odyssey', 'An ancient Greek epic poem recounting the journey of Odysseus.');
INSERT INTO Test2 ("RowName","RowInfo") VALUES ('Jane Eyre', 'A classic romance novel featuring a strong-willed heroine.');
INSERT INTO Test2 ("RowName","RowInfo") VALUES ('Frankenstein', 'A groundbreaking work of science fiction exploring themes of creation and responsibility.');
INSERT INTO Test2 ("RowName","RowInfo") VALUES ('The Brothers Karamazov', 'A philosophical novel delving into the nature of faith and morality.');
INSERT INTO Test2 ("RowName","RowInfo") VALUES ('Don Quixote', 'A satirical novel following the adventures of a delusional knight-errant.');
INSERT INTO Test2 ("RowName","RowInfo") VALUES ('The Grapes of Wrath', 'A powerful novel depicting the struggles of migrant workers during the Great Depression.');
INSERT INTO Test2 ("RowName","RowInfo") VALUES ('Crime and Punishment', 'A psychological thriller exploring guilt and redemption in St. Petersburg.');

INSERT INTO TestImg ("RowName","RowInfo") VALUES ('The Great Gatsby', 'A classic novel depicting the Jazz Age.');
INSERT INTO TestImg ("RowName","RowInfo") VALUES ('To Kill a Mockingbird', 'A poignant story tackling racial injustice in the American South.');
INSERT INTO TestImg ("RowName","RowInfo") VALUES ('1984', 'A dystopian masterpiece exploring totalitarianism and surveillance.');
INSERT INTO TestImg ("RowName","RowInfo") VALUES ('Pride and Prejudice', 'A timeless romance set in Regency-era England.');
INSERT INTO TestImg ("RowName","RowInfo") VALUES ('The Catcher in the Rye', 'A coming-of-age novel capturing teenage angst and rebellion.');
INSERT INTO TestImg ("RowName","RowInfo") VALUES ('The Lord of the Rings', 'An epic fantasy saga chronicling the journey to destroy the One Ring.');
INSERT INTO TestImg ("RowName","RowInfo") VALUES ('Harry Potter and the Sorcerers Stone', 'The first book in the beloved series about a young wizard.');
INSERT INTO TestImg ("RowName","RowInfo") VALUES ('To the Lighthouse', 'A modernist novel exploring themes of perception and subjectivity.');
INSERT INTO TestImg ("RowName","RowInfo") VALUES ('Moby-Dick', 'An epic tale of obsession and revenge set against the backdrop of whaling.');
INSERT INTO TestImg ("RowName","RowInfo") VALUES ('The Hobbit', 'A charming adventure about a hobbit embarking on a quest.');
INSERT INTO TestImg ("RowName","RowInfo") VALUES ('Brave New World', 'A speculative fiction novel envisioning a dystopian society driven by technology and hedonism.');
INSERT INTO TestImg ("RowName","RowInfo") VALUES ('Wuthering Heights', 'A dark and passionate tale of love and revenge on the Yorkshire moors.');
INSERT INTO TestImg ("RowName","RowInfo") VALUES ('The Picture of Dorian Gray', 'A Gothic novel exploring the nature of vanity and moral corruption.');
INSERT INTO TestImg ("RowName","RowInfo") VALUES ('The Odyssey', 'An ancient Greek epic poem recounting the journey of Odysseus.');
INSERT INTO TestImg ("RowName","RowInfo") VALUES ('Jane Eyre', 'A classic romance novel featuring a strong-willed heroine.');
INSERT INTO TestImg ("RowName","RowInfo") VALUES ('Frankenstein', 'A groundbreaking work of science fiction exploring themes of creation and responsibility.');
INSERT INTO TestImg ("RowName","RowInfo") VALUES ('The Brothers Karamazov', 'A philosophical novel delving into the nature of faith and morality.');
INSERT INTO TestImg ("RowName","RowInfo") VALUES ('Don Quixote', 'A satirical novel following the adventures of a delusional knight-errant.');
INSERT INTO TestImg ("RowName","RowInfo") VALUES ('The Grapes of Wrath', 'A powerful novel depicting the struggles of migrant workers during the Great Depression.');
INSERT INTO TestImg ("RowName","RowInfo") VALUES ('Crime and Punishment', 'A psychological thriller exploring guilt and redemption in St. Petersburg.');

INSERT INTO login ("username", "password", "isAdmin")
VALUES ('admin', '66647C984DBCBC8BC9B6E8D27636A5F5F8D6830D16512A123168B825E9369958', 0),
       ('user', '5D25062CCD2521E628C4D089DFC2AEB70FAE1A220920CDF1F83F3484D4505081', 0);
