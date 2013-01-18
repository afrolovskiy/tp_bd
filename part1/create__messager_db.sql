
CREATE TABLE account_contact_list_relationship
(
	account_id           INTEGER NOT NULL,
	contact_list_id      INTEGER NOT NULL,
	id                   BIGINT NOT NULL
);



ALTER TABLE account_contact_list_relationship
ADD PRIMARY KEY (id);



CREATE TABLE account_conversation_relationship
(
	account_id           INTEGER NOT NULL,
	conversation_id      BIGINT NOT NULL,
	id                   BIGINT NOT NULL
);



ALTER TABLE account_conversation_relationship
ADD PRIMARY KEY (id);



CREATE TABLE account_types
(
	name                 VARCHAR(32) NOT NULL,
	account_type_id      SMALLINT NOT NULL
);



ALTER TABLE account_types
ADD PRIMARY KEY (account_type_id);



CREATE TABLE accounts
(
	created_at           TIMESTAMP NULL,
	login                VARCHAR(32) NOT NULL,
	password             VARCHAR(32) NOT NULL,
	user_id              INTEGER NOT NULL,
	last_logined_at      TIMESTAMP NULL,
	type_account_id      SMALLINT NOT NULL,
	account_id           INTEGER NOT NULL
);



ALTER TABLE accounts
ADD PRIMARY KEY (account_id);



CREATE TABLE contact_lists
(
	alias                VARCHAR(32) NOT NULL,
	contact_list_id      INTEGER NOT NULL,
	account_id           INTEGER NOT NULL
);



ALTER TABLE contact_lists
ADD PRIMARY KEY (contact_list_id);



CREATE TABLE conversations
(
	created_at           TIMESTAMP NULL,
	is_open              BOOLEAN NOT NULL,
	conversation_id      BIGINT NOT NULL
);



ALTER TABLE conversations
ADD PRIMARY KEY (conversation_id);



CREATE TABLE messages
(
	content              TEXT NOT NULL,
	created_at           TIMESTAMP NULL,
	is_readed            BOOLEAN NOT NULL,
	account_id           INTEGER NOT NULL,
	message_id           BIGINT NOT NULL,
	conversation_id      BIGINT NOT NULL
);



ALTER TABLE messages
ADD PRIMARY KEY (message_id);



CREATE TABLE states
(
	name                 VARCHAR(32) NOT NULL,
	state_id             SMALLINT NOT NULL
);



ALTER TABLE states
ADD PRIMARY KEY (state_id);



CREATE TABLE statuses
(
	status_message       VARCHAR(128) NULL,
	account_id           INTEGER NOT NULL,
	status_id            BIGINT NOT NULL,
	changed_at           TIMESTAMP NULL,
	state_id             SMALLINT NOT NULL
);



ALTER TABLE statuses
ADD PRIMARY KEY (status_id);



CREATE TABLE users
(
	first_name           VARCHAR(128) NULL,
	last_name            VARCHAR(128) NULL,
	is_male              ENUM NULL,
	birthday             DATE NULL,
	gender               ENUM NULL,
	user_id              INTEGER NOT NULL,
	login                VARCHAR(32) NOT NULL,
	password             VARCHAR(32) NOT NULL
);



ALTER TABLE users
ADD PRIMARY KEY (user_id);



ALTER TABLE account_contact_list_relationship
ADD FOREIGN KEY R_29 (account_id) REFERENCES accounts (account_id);



ALTER TABLE account_contact_list_relationship
ADD FOREIGN KEY R_30 (contact_list_id) REFERENCES contact_lists (contact_list_id);



ALTER TABLE account_conversation_relationship
ADD FOREIGN KEY R_27 (account_id) REFERENCES accounts (account_id);



ALTER TABLE account_conversation_relationship
ADD FOREIGN KEY R_28 (conversation_id) REFERENCES conversations (conversation_id);



ALTER TABLE accounts
ADD FOREIGN KEY R_15 (user_id) REFERENCES users (user_id);



ALTER TABLE accounts
ADD FOREIGN KEY R_6 (type_account_id) REFERENCES account_types (account_type_id);



ALTER TABLE contact_lists
ADD FOREIGN KEY R_19 (account_id) REFERENCES accounts (account_id);



ALTER TABLE messages
ADD FOREIGN KEY R_12 (account_id) REFERENCES accounts (account_id);



ALTER TABLE messages
ADD FOREIGN KEY R_11 (conversation_id) REFERENCES conversations (conversation_id);



ALTER TABLE statuses
ADD FOREIGN KEY R_18 (account_id) REFERENCES accounts (account_id);



ALTER TABLE statuses
ADD FOREIGN KEY R_8 (state_id) REFERENCES states (state_id);


