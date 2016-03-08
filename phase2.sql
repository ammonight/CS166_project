DROP TABLE Message CASCADE;
DROP TABLE Usr CASCADE;
DROP TABLE Chat CASCADE;
DROP TABLE Chat_list CASCADE;
DROP TABLE Usr_list CASCADE;
DROP TABLE Contains CASCADE;

CREATE TABLE Message (
   id INTEGER,
   text CHAR(140) NOT NULL,
   timestamp timestamp NOT NULL,
   status char(30) NOT NULL,
   login CHAR(50) UNIQUE,
   chat_id INTEGER,
   PRIMARY KEY(id),
   FOREIGN KEY(login) REFERENCES Usr(login),
   FOREIGN KEY(chat_id) REFERENCES Chat(id));

CREATE TABLE Usr (
   phoneNum CHAR(13) NOT NULL UNIQUE,
   login CHAR(50) UNIQUE,
   password CHAR(50) NOT NULL,
   status CHAR(140),
   --something for block/contact list
   PRIMARY KEY(login));

CREATE TABLE Chat (
   id INTEGER,
   chat_type CHAR(10) NOT NULL,
   sender_login CHAR(50) UNIQUE,
   PRIMARY KEY(id),
   FOREIGN KEY(sender_login) REFERENCES Usr(login));

CREATE TABLE Chat_list (
   login CHAR(50) UNIQUE,
   id INTEGER,
   PRIMARY KEY(login, id),
   FOREIGN KEY(login) REFERENCES Usr(login),
   FOREIGN KEY(id) REFERENCES Chat(id));
/*
CREATE TABLE Usr_list (
   list_type CHAR(10) NOT NULL,
   login CHAR(50) UNIQUE,
   
   --other stuff
   );

CREATE TABLE Contains (
   login CHAR(50) UNIQUE,

*/
