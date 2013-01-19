CREATE TABLE account_contact_list_relationship
(
	account_id           INTEGER NOT NULL,
	contact_list_id      INTEGER NOT NULL,
	id                        BIGINT NOT NULL
);

ALTER TABLE account_contact_list_relationship
ADD PRIMARY KEY (id);

ALTER TABLE account_contact_list_relationship
MODIFY COLUMN id INTEGER AUTO_INCREMENT;

CREATE TABLE account_conversation_relationship
(
	account_id             INTEGER NOT NULL,
	conversation_id      BIGINT NOT NULL,
	id                          BIGINT NOT NULL
);

ALTER TABLE account_conversation_relationship
ADD PRIMARY KEY (id);

ALTER TABLE account_conversation_relationship
MODIFY COLUMN id INTEGER AUTO_INCREMENT;

CREATE TABLE account_types
(
	name                 VARCHAR(32) NOT NULL,
	id                      SMALLINT NOT NULL
);

ALTER TABLE account_types
ADD PRIMARY KEY (id);

ALTER TABLE account_types
MODIFY COLUMN id SMALLINT AUTO_INCREMENT;

CREATE TABLE accounts
(
	created_at                TIMESTAMP NULL,
	login                         VARCHAR(32) NOT NULL,
	password                  VARCHAR(32) NOT NULL,
	user_id                      INTEGER NOT NULL,
	last_logined_at           TIMESTAMP NULL,
	account_types_id         SMALLINT NOT NULL,
	id                              INTEGER NOT NULL
);

ALTER TABLE accounts
ADD PRIMARY KEY (id);

ALTER TABLE accounts
MODIFY COLUMN id INTEGER AUTO_INCREMENT;

CREATE TABLE contact_lists
(
	alias                    VARCHAR(32) NOT NULL,
	id                        INTEGER NOT NULL,
	account_id           INTEGER NOT NULL
);

ALTER TABLE contact_lists
ADD PRIMARY KEY (id);

ALTER TABLE contact_lists
MODIFY COLUMN id INTEGER AUTO_INCREMENT;

CREATE TABLE conversations
(
	created_at         TIMESTAMP NULL,
	is_open             BOOLEAN NOT NULL,
	id                      BIGINT NOT NULL
);

ALTER TABLE conversations
ADD PRIMARY KEY (id);

ALTER TABLE conversations
MODIFY COLUMN id BIGINT AUTO_INCREMENT;

CREATE TABLE messages
(
	content                  TEXT NOT NULL,
	created_at              TIMESTAMP NULL,
	is_readed               BOOLEAN NOT NULL,
	account_id             INTEGER NOT NULL,
	id                          BIGINT NOT NULL,
	conversation_id      BIGINT NOT NULL
);

ALTER TABLE messages
ADD PRIMARY KEY (id);

ALTER TABLE messages
MODIFY COLUMN id INTEGER AUTO_INCREMENT;

CREATE TABLE states
(
	name                 VARCHAR(32) NOT NULL,
	id                      SMALLINT NOT NULL
);

ALTER TABLE states
ADD PRIMARY KEY (id);

ALTER TABLE states
MODIFY COLUMN id SMALLINT AUTO_INCREMENT;

CREATE TABLE statuses
(
	status_message     VARCHAR(128) NULL,
	account_id             INTEGER NOT NULL,
	id                          BIGINT NOT NULL,
	changed_at            TIMESTAMP NULL,
	state_id                 SMALLINT NOT NULL
);

ALTER TABLE statuses
ADD PRIMARY KEY (id);

ALTER TABLE statuses
MODIFY COLUMN id INTEGER AUTO_INCREMENT;

CREATE TABLE users
(
	first_name          VARCHAR(128) NULL,
	last_name          VARCHAR(128) NULL,
	is_male              ENUM('None', 'True', 'False'),
	birthday             DATE NULL,
	gender               ENUM('None', 'Male', 'Female'),
	id                      INTEGER NOT NULL,
	login                  VARCHAR(32) NOT NULL,
	password           VARCHAR(32) NOT NULL
);

ALTER TABLE users
ADD PRIMARY KEY (id);

ALTER TABLE users
MODIFY COLUMN id INTEGER AUTO_INCREMENT;

ALTER TABLE account_contact_list_relationship
ADD FOREIGN KEY R_29 (account_id) REFERENCES accounts (id);

ALTER TABLE account_contact_list_relationship
ADD FOREIGN KEY R_30 (contact_list_id) REFERENCES contact_lists (id);

ALTER TABLE account_conversation_relationship
ADD FOREIGN KEY R_27 (account_id) REFERENCES accounts (id);

ALTER TABLE account_conversation_relationship
ADD FOREIGN KEY R_28 (conversation_id) REFERENCES conversations (id);

ALTER TABLE accounts
ADD FOREIGN KEY R_15 (user_id) REFERENCES users (id);

ALTER TABLE accounts
ADD FOREIGN KEY R_6 (account_types_id) REFERENCES account_types (id);

ALTER TABLE contact_lists
ADD FOREIGN KEY R_19 (account_id) REFERENCES accounts (id);

ALTER TABLE messages
ADD FOREIGN KEY R_12 (account_id) REFERENCES accounts (id);

ALTER TABLE messages
ADD FOREIGN KEY R_11 (conversation_id) REFERENCES conversations (id);

ALTER TABLE statuses
ADD FOREIGN KEY R_18 (account_id) REFERENCES accounts (id);

ALTER TABLE statuses
ADD FOREIGN KEY R_8 (state_id) REFERENCES states (id);
