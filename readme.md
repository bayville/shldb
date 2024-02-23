### Säsongstabell (`Seasons`)

| Fält          | Typ     | Null  | Nyckel | Default      | Extra             |
|---------------|---------|-------|--------|--------------|-------------------|
| SesID         | int(11) | Nej   | PK     | NULL         | 202324    |
| SesNamn       | varchar | Ja    |        | NULL         |     2023/24              |
| StartDate     | date    | Ja    |        | NULL         |                   |
| EndDate       | date    | Ja    |        | NULL         |                   |

#### Frågeställningar kring säsongstabellen:
- Måste man ha `StartDate`/`EndDate`? För- och nackdelar?
- Bör man ha `seasonSettings` för att räkna ut poäng till en tabell? Ex. W = 2, OTW = 2, OTL = 1

### Lagstabell (`Teams`)

| Fält    | Typ     | Null  | Nyckel | Default      | Extra             |
|---------|---------|-------|--------|--------------|-------------------|
| LagID   | int(11) | Nej   | PK     | NULL         |     |
| LagNamn | varchar | Ja    |        | NULL         |                   |

#### Frågeställningar kring lagstabellen:
- Hur hanterar man namnbyten, eller är det ens viktigt?

### Areatabell (`Venues`)

| Fält      | Typ     | Null  | Nyckel | Default      | Extra             |
|-----------|---------|-------|--------|--------------|-------------------|
| ArenaID   | int(11) | Nej   | PK     | NULL         |    |
| ArenaNamn | varchar | Ja    |        | NULL         |                   |

#### Frågeställningar kring arenatabellen:
- Hur hanterar man namnbyten, eller är det ens viktigt?

### Matchtabell (`Games`)

| Fält        | Typ     | Null  | Nyckel | Default      | Extra             |
|-------------|---------|-------|--------|--------------|-------------------|
| GameID     | int(11) | Nej   | PK     | NULL         | auto_increment    |
| SesID       | int(11) | Ja    | FK     | NULL         |  Från Season                 |
| Hemmalag    | int(11) | Ja    | FK     | NULL         |     Från Teams              |
| Bortalag    | int(11) | Ja    | FK     | NULL         |   Från Teams                |
| HemmaMål    | int(11) | Ja    |        | NULL         |                   |
| BortaMål    | int(11) | Ja    |        | NULL         |                   |
| Arena       | int(11) | Ja    | FK     | NULL         |        Från Venue           |
| Publik      | int(11) | Ja    |        | NULL         |                   |

#### Frågeställningar kring matchtabellen:
- Bör målen ligga i den här tabellen, eller bör de räknas fram från periodscore?
- Hur hanterar man slutspel? MatchType = RegularSeason?

### Periodscores-tabell (`PeriodScores`)

| Fält            | Typ     | Null  | Nyckel | Default      | Extra             |
|-----------------|---------|-------|--------|--------------|-------------------|
| PerID           | int(11) | Nej   | PK     | NULL         |     |
| GameID         | int(11) | Ja    | FK     | NULL         |     Från Games              |
| PerNr           | int(11) | Ja    |        | NULL         |                Alt. Varchar   |
| LagID           | int(11) | Ja    | FK     | NULL         |  Från Teams                 |
| Mål             | int(11) | Ja    |        | NULL         |                   |

#### Frågeställning kring periodscores-tabellen:
- Kan man göra såhär för att få fram vilket motstånd det är man möter?
- Hur hanterar man t.ex. overtime som pågår tills det är en vinnare och ej straffar, benämner man straffar som `PerNr = STR`? Hur blir performance?
