create schema if not exists flight;
use flight;

-- PRAGMA foreign_keys=OFF;
SET FOREIGN_KEY_CHECKS = 1;
-- BEGIN TRANSACTION;
START transaction;

DROP TABLE if exists airports;
CREATE TABLE airports (
faa char(3) primary key,
name varchar(100) not null,
tzone varchar(50) not null
);
INSERT INTO airports VALUES('DFW','Dallas Fort Worth Intl','America/Chicago');
INSERT INTO airports VALUES('BQK','Brunswick Golden Isles','America/New_York');
INSERT INTO airports VALUES('EWR','Newark Liberty Intl','America/New_York');
INSERT INTO airports VALUES('FLL','Fort Lauderdale Hollywood Intl','America/New_York');
INSERT INTO airports VALUES('IAH','George Bush Intercontinental','America/Chicago');
INSERT INTO airports VALUES('JFK','John F Kennedy Intl','America/New_York');
INSERT INTO airports VALUES('LGA','La Guardia','America/New_York');
INSERT INTO airports VALUES('MIA','Miami Intl','America/New_York');
INSERT INTO airports VALUES('ORD','Chicago Ohare Intl','America/Chicago');
INSERT INTO airports VALUES('PVG','Shanghai Pudong International Airport','China Standard Time');
INSERT INTO airports VALUES('AMS','AMS-Amsterdam Airport Schiphol','Central European Summer Time');
drop table if exists airlines;
CREATE TABLE airlines (
carrier char(2) primary key,
name varchar(100) not null
);
INSERT INTO airlines VALUES('9E','Endeavor Air Inc.');
INSERT INTO airlines VALUES('AA','American Airlines Inc.');
INSERT INTO airlines VALUES('AS','Alaska Airlines Inc.');
INSERT INTO airlines VALUES('B6','JetBlue Airways');
INSERT INTO airlines VALUES('DL','Delta Air Lines Inc.');
INSERT INTO airlines VALUES('EV','ExpressJet Airlines Inc.');
INSERT INTO airlines VALUES('F9','Frontier Airlines Inc.');
INSERT INTO airlines VALUES('FL','AirTran Airways Corporation');
INSERT INTO airlines VALUES('HA','Hawaiian Airlines Inc.');
INSERT INTO airlines VALUES('MQ','Envoy Air');
INSERT INTO airlines VALUES('OO','SkyWest Airlines Inc.');
INSERT INTO airlines VALUES('UA','United Air Lines Inc.');
INSERT INTO airlines VALUES('US','US Airways Inc.');
INSERT INTO airlines VALUES('VX','Virgin America');
INSERT INTO airlines VALUES('WN','Southwest Airlines Co.');
INSERT INTO airlines VALUES('YV','Mesa Airlines Inc.');

drop table if exists flights;
CREATE TABLE flights (
id int primary key auto_increment,
origin char(3) not null,
destination char(3) not null,
duration int not null,
foreign key (origin) references airports(faa),
foreign key (destination) references airports(faa)
);
INSERT INTO flights VALUES(1,'DFW','ORD',165);
INSERT INTO flights VALUES(2,'EWR','IAH',227);
INSERT INTO flights VALUES(3,'JFK','MIA',160);
INSERT INTO flights VALUES(4,'JFK','BQK',300);
INSERT INTO flights VALUES(5,'EWR','ORD',150);
INSERT INTO flights VALUES(6,'EWR','FLL',158);
INSERT INTO flights VALUES(7,'LGA','DFW',257);
INSERT INTO flights VALUES(9,'ORD','AMS',420);
-- DELETE FROM sqlite_sequence;
-- INSERT INTO sqlite_sequence VALUES('flights',9);
COMMIT;
