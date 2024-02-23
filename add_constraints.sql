-- Lägg till primärnyckel för Säsongar-tabellen
ALTER TABLE Seasons ADD CONSTRAINT pk_Seasons PRIMARY KEY (SeasonID);

-- Lägg till primärnyckel för Veckodagar-tabellen
ALTER TABLE Weekdays ADD CONSTRAINT pk_Weekdays PRIMARY KEY (WeekdayID);

-- Lägg till primärnyckel för Lag-tabellen
ALTER TABLE Teams ADD CONSTRAINT pk_Teams PRIMARY KEY (TeamID);

-- Lägg till främmande nyckel för SeasonID i Matches-tabellen
ALTER TABLE Matches ADD CONSTRAINT fk_Matches_SeasonID FOREIGN KEY (SeasonID) REFERENCES Seasons(SeasonID);

-- Lägg till främmande nyckel för WeekdayID i Matches-tabellen
ALTER TABLE Matches ADD CONSTRAINT fk_Matches_WeekdayID FOREIGN KEY (WeekdayID) REFERENCES Weekdays(WeekdayID);

-- Lägg till främmande nyckel för HomeTeamID i Matches-tabellen
ALTER TABLE Matches ADD CONSTRAINT fk_Matches_HomeTeamID FOREIGN KEY (HomeTeamID) REFERENCES Teams(TeamID);

-- Lägg till främmande nyckel för AwayTeamID i Matches-tabellen
ALTER TABLE Matches ADD CONSTRAINT fk_Matches_AwayTeamID FOREIGN KEY (AwayTeamID) REFERENCES Teams(TeamID);
