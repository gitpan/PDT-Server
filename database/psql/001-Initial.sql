--Account:
--
-- * Email address
-- * Registration date
-- * Password hash

CREATE TABLE account(
    id   SERIAL PRIMARY KEY NOT NULL,
    email        TEXT      NOT NULL UNIQUE,
    login        TEXT      NOT NULL UNIQUE,
    password     CHAR(128) NOT NULL,
    registration TIMESTAMP NOT NULL DEFAULT NOW(),
    full_name    TEXT      NOT NULL,
    verification CHAR(128) UNIQUE
);

--Architecture:
--
-- * Name (x86, x86_64, etc.)

CREATE TABLE architecture(
    id SERIAL PRIMARY KEY NOT NULL,
    name TEXT NOT NULL
);

--
--Operating system:
--
-- * Name
-- * Version
-- * Distribution

CREATE TABLE operatingsystem(
    id      SERIAL PRIMARY KEY NOT NULL,
    name    TEXT   NOT NULL,
    version REAL   NOT NULL,
    distribution TEXT
);

CREATE TABLE plugin(
    id SERIAL PRIMARY KEY NOT NULL,
    name TEXT NOT NULL
);

--Host:
--
-- * linked to account (optional)
-- * Last checkin stamp
-- * registration date
-- * Architecture
-- * Operating system

CREATE TABLE host(
    id  SERIAL PRIMARY KEY NOT NULL,
    account_id      INTEGER REFERENCES account( id ), --Can be null.
    registration    TIMESTAMP NOT NULL DEFAULT NOW(),
    architecture_id INTEGER REFERENCES architecture( id ) NOT NULL,
    operatingsystem_id INTEGER REFERENCES operatingsystem( id ) NOT NULL,
    hostname        TEXT NOT NULL,
    UNIQUE( account_id, hostname )
);

--Checkin:
CREATE TABLE host_checkin(
    id  SERIAL PRIMARY KEY NOT NULL,
    event   TIMESTAMP NOT NULL DEFAULT NOW(),
    host_id INTEGER REFERENCES host( id ) NOT NULL
);

CREATE TABLE host_plugin(
    id  SERIAL PRIMARY KEY NOT NULL,
    host_id   INTEGER REFERENCES host( id ) NOT NULL,
    plugin_id INTEGER REFERENCES plugin( id ) NOT NULL
);

--Request:
--
-- * Account (optional)
-- * time
-- * Assigned (host)
-- * Architecture
-- * Operating system

CREATE TABLE request(
    id      SERIAL PRIMARY KEY NOT NULL,
    issued       TIMESTAMP NOT NULL DEFAULT NOW(),
    account_id   INTEGER REFERENCES account( id ), --Can be null
    assigned     INTEGER REFERENCES host( id ),
    source_uri   TEXT NOT NULL,
    plugin_id    INTEGER REFERENCES plugin( id ) NOT NULL,
    architecture_id     INTEGER REFERENCES architecture( id ) NOT NULL,
    operatingsystem_id  INTEGER REFERENCES operatingsystem( id ) NOT NULL
);

--Answer:
--
-- * Request
-- * Host
-- * STDOUT
-- * STDERR
-- * TAP Results
-- * Date

CREATE TABLE answer(
    id   SERIAL PRIMARY KEY NOT NULL,
    request_id  INTEGER REFERENCES request( id ) NOT NULL,
    host_id     INTEGER REFERENCES host( id ) NOT NULL,
    data        TEXT NOT NULL,
    success     BOOLEAN NOT NULL,
    received    TIMESTAMP NOT NULL DEFAULT NOW()
);
