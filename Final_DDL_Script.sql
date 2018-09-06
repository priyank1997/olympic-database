CREATE SCHEMA Olympic;
SET SEARCH_PATH TO Olympic;


CREATE TABLE Country (
  Country_Id VARCHAR(50) NOT NULL,
  Country_Name  VARCHAR(100) NOT NULL,
  PRIMARY KEY (Country_Id),
  UNIQUE (Country_Name)
);

CREATE TABLE  Sport (
  Sport_Id VARCHAR(50) NOT NULL,
  Sport_Name VARCHAR(100) NOT NULL,
  PRIMARY KEY (Sport_Id),
  UNIQUE (Sport_Name)
);

CREATE TABLE Player (
  Player_Id VARCHAR(50) NOT NULL,
  Player_Name VARCHAR(255) NOT NULL,
  Gender VARCHAR(50) NOT NULL,
  Height INT NOT NULL,
  Weight INT NOT NULL,
  DOB DATE NOT NULL,
  Country_Id VARCHAR(50) NOT NULL,
  Sport_Id VARCHAR(50) NOT NULL,
  PRIMARY KEY (Player_Id),
  FOREIGN KEY (Country_Id) REFERENCES Country(Country_Id),
  FOREIGN KEY (Sport_Id) REFERENCES Sport(Sport_Id)
);

CREATE TABLE Event (

Event_Id VARCHAR(50) NOT NULL,
 Event_Name VARCHAR(100) NOT NULL,
 Event_Type VARCHAR(100) NOT NULL,
 Event_Sex VARCHAR(10) NOT NULL,
 Discipline VARCHAR(100) NOT NULL,
 Sport_Id VARCHAR(100) NOT NULL,
 PRIMARY KEY (Event_Id),
 UNIQUE (Event_Name),
 FOREIGN KEY (Sport_Id) REFERENCES Sport(Sport_Id)
);

CREATE TABLE Venue (
  Venue_Id VARCHAR(50) NOT NULL,
  Venue_Name VARCHAR(100) NOT NULL,
  Capacity  INT NOT NULL,
  PRIMARY KEY (Venue_Id),
  UNIQUE (Venue_Name)
);

CREATE TABLE  Team (
  Team_Id VARCHAR(50) NOT NULL,
  Country_Id VARCHAR(50) NOT NULL,
  Event_Id VARCHAR(50) NOT NULL,
  PRIMARY KEY (Team_Id),
  FOREIGN KEY (Event_Id) REFERENCES Event(Event_Id),
  FOREIGN KEY (Country_Id) REFERENCES Country(Country_Id)
);

CREATE TABLE  Team_Members (
  Team_Id VARCHAR(50) NOT NULL,
  Player_Id VARCHAR(50) NOT NULL,
  PRIMARY KEY (Team_Id, Player_Id),
  FOREIGN KEY (Team_Id) REFERENCES Team(Team_Id),
  FOREIGN KEY (Player_Id) REFERENCES Player(Player_Id)
);

CREATE TABLE Event_Match (
  Match_Id VARCHAR(50) NOT NULL,
  Event_Phase VARCHAR(100) NOT NULL,
  Event_Date DATE NOT NULL,
  Olympic_Day VARCHAR(50) NOT NULL,
  Event_Id VARCHAR(50) NOT NULL,
  Venue_Id VARCHAR(50) NOT NULL,
  PRIMARY KEY (Match_Id),
  FOREIGN KEY (Event_Id) REFERENCES Event(Event_Id),
  FOREIGN KEY (Venue_Id) REFERENCES Venue(Venue_Id)
);

CREATE TABLE Event_Venue (
  Event_Id VARCHAR(50) NOT NULL,
  Venue_Id VARCHAR(50) NOT NULL,
  PRIMARY KEY (Event_Id, Venue_Id),
  FOREIGN KEY (Event_Id) REFERENCES Event(Event_Id),
  FOREIGN KEY (Venue_Id) REFERENCES Venue(Venue_Id)
);


CREATE TABLE Individual_Medal (
  Event_Id VARCHAR(50) NOT NULL,
  Player_Id VARCHAR(50) NOT NULL,
  Medal_Type VARCHAR(50) NOT NULL,
  PRIMARY KEY (Event_Id, Player_Id),
  FOREIGN KEY (Event_Id) REFERENCES Event(Event_Id),
  FOREIGN KEY (Player_Id) REFERENCES Player(Player_Id)
);

CREATE TABLE Individual_Record (
  Match_Id VARCHAR(50) NOT NULL,
  Player_Id VARCHAR(50) NOT NULL,
  Record_Type VARCHAR(100) NOT NULL,
  Record_Score VARCHAR(50) NOT NULL,
  PRIMARY KEY (Match_Id, Player_Id),
  FOREIGN KEY (Match_Id) REFERENCES Event_Match(Match_Id),
  FOREIGN KEY (Player_Id) REFERENCES Player(Player_Id)
);

CREATE TABLE Player_Match (
  Match_Id VARCHAR(50) NOT NULL,
  Player_Id VARCHAR(50) NOT NULL,
  Score VARCHAR(50) NOT NULL,
  Position INT NOT NULL,
  PRIMARY KEY (Match_Id, Player_Id),
  FOREIGN KEY (Match_Id) REFERENCES Event_Match(Match_Id),
  FOREIGN KEY (Player_Id) REFERENCES Player(Player_Id)
);

CREATE TABLE  Player_Participation (
  Event_Id VARCHAR(50) NOT NULL,
  Player_Id VARCHAR(50) NOT NULL,
  PRIMARY KEY (Event_Id, Player_Id),
  FOREIGN KEY (Event_Id) REFERENCES Event(Event_Id),
  FOREIGN KEY (Player_Id) REFERENCES Player(Player_Id)
); 

CREATE TABLE  Team_Match (
  Match_Id VARCHAR(50) NOT NULL,
  Team_Id VARCHAR(50) NOT NULL,
  Score VARCHAR(100) NOT NULL,
  Position INT NOT NULL,
  PRIMARY KEY (Match_Id, Team_Id),
  FOREIGN KEY (Match_Id) REFERENCES Event_Match(Match_Id),
  FOREIGN KEY (Team_Id) REFERENCES Team(Team_Id)

) ;

CREATE TABLE Team_Medal (
  Event_Id VARCHAR(50) NOT NULL,
  Team_Id VARCHAR(50) NOT NULL,
  Medal_type VARCHAR(50) NOT NULL,
  PRIMARY KEY (Event_Id, Team_Id),
  FOREIGN KEY (Event_Id) REFERENCES Event(Event_Id),
  FOREIGN KEY (Team_Id) REFERENCES Team(Team_Id)
);

CREATE TABLE Team_Record (
  Match_Id VARCHAR(50) NOT NULL,
  Team_Id VARCHAR(50) NOT NULL,
  Record_Type VARCHAR(50) NOT NULL,
  Record_Score VARCHAR(100) NOT NULL,
  PRIMARY KEY (Match_Id, Team_Id),
  FOREIGN KEY (Match_Id) REFERENCES Event_Match(Match_Id),
  FOREIGN KEY (Team_Id) REFERENCES Team(Team_Id)
);



