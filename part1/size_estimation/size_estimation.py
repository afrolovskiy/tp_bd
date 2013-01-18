print "Measure table record size"


BIGINT = 8
INTEGER = 4
SMALLINT = 2
BOOLEAN = 1
ENUM = 1

DATE = 3
TIMESTAMP = 4

def VARCHAR(length):
	return length + 1

def TEXT(length):
	return length + 2


out = open('size_estimation.txt', 'w')


print "-----------------------------------------------------------"
users_record = INTEGER + VARCHAR(32)  + VARCHAR(32)  + VARCHAR(128)  + \
	VARCHAR(128)  + DATE + ENUM + ENUM

print "users record: {}".format(users_record)
out.write("users record: {}\n".format(users_record))

users_count = 1000000
print "users count: {}".format(users_count)
out.write("users count: {}\n".format(users_count))

users_table = users_record * users_count
print "users table: {}".format(users_table)
out.write("users table: {}\n".format(users_table))


print "-----------------------------------------------------------"
accounts_record = INTEGER + VARCHAR(32) + VARCHAR(32) + INTEGER + \
	SMALLINT + TIMESTAMP + TIMESTAMP

print "accounts record: {}".format(accounts_record)
out.write("accounts record: {}\n".format(accounts_record))

accounts_count = 4000000
print "account count: {}".format(accounts_count)
out.write("account count: {}\n".format(accounts_count))

accounts_table = accounts_record * accounts_count
print "account table: {}".format(accounts_table)
out.write("account table: {}\n".format(accounts_table))


print "-----------------------------------------------------------"
account_types_record = SMALLINT + VARCHAR(32)
print "account_types record: {}".format(account_types_record)
out.write("account_types record: {}\n".format(account_types_record))

account_types_count = 400
print "account_types count: {}".format(account_types_count)
out.write("account_types count: {}\n".format(account_types_count))

account_types_table = account_types_record * account_types_count
print "account_types table:{}".format(account_types_table)
out.write("account_types table:{}\n".format(account_types_table))


print "-----------------------------------------------------------"
statuses_record = BIGINT + INTEGER + SMALLINT + VARCHAR(128) + TIMESTAMP

print "statuses record: {}".format(statuses_record)
out.write("statuses record: {}\n".format(statuses_record))

statuses_count = 3000000000
print "statuses count: {}".format(statuses_count)
out.write("statuses count: {}\n".format(statuses_count))

statuses_table = statuses_record * statuses_count
print "statuses table: {}".format(statuses_table)
out.write("statuses table: {}\n".format(statuses_table))


print "-----------------------------------------------------------"
states_record = SMALLINT + VARCHAR(32)

print "states record: {}".format(states_record)
out.write("states record: {}\n".format(states_record))

states_count = 30
print "states count: {}".format(states_count)
out.write("states count: {}\n".format(states_count))

states_table = states_record * states_count
print "states table: {}".format(states_table)
out.write("states table: {}\n".format(states_table))


print "-----------------------------------------------------------"
account_contact_list_relationship_record = BIGINT + INTEGER + INTEGER

print "account_contact_list_relationship record: {}".format(
	account_contact_list_relationship_record)
out.write("account_contact_list_relationship record: {}\n".format(
	account_contact_list_relationship_record))

account_contact_list_relationship_count = 400000000
print "account_contact_list_relationship count: {}".format(
	account_contact_list_relationship_count)
out.write("account_contact_list_relationship count: {}\n".format(
	account_contact_list_relationship_count))

account_contact_list_relationship_table = account_contact_list_relationship_record * \
	account_contact_list_relationship_count
print "account_contact_list_relationship_table: {}".format(
	account_contact_list_relationship_table)
out.write("account_contact_list_relationship_table: {}\n".format(
	account_contact_list_relationship_table))


print "-----------------------------------------------------------"
contact_lists_record = INTEGER + INTEGER + VARCHAR(32)

print "contact_lists: {}".format(contact_lists_record)
out.write("contact_lists: {}\n".format(contact_lists_record))

contact_lists_count = 4000000
print "contact_lists count: {}".format(contact_lists_count)
out.write("contact_lists count: {}\n".format(contact_lists_count))

contact_lists_table = contact_lists_record * contact_lists_count
print "contact_lists table: {}".format(contact_lists_table)
out.write("contact_lists table: {}\n".format(contact_lists_table))


print "-----------------------------------------------------------"
account_conversation_relationship_record = BIGINT + INTEGER + BIGINT

print "account_conversation_relationship record: {}".format(
	account_conversation_relationship_record)
out.write("account_conversation_relationship record: {}\n".format(
	account_conversation_relationship_record))

account_conversation_relationship_count = 70000000000
print "account_conversation_relationship count: {}".format(
	account_conversation_relationship_count)
out.write("account_conversation_relationship count: {}\n".format(
	account_conversation_relationship_count))

account_conversation_relationship_table = account_conversation_relationship_record * \
	account_conversation_relationship_count
print "account_conversation_relationship table: {}".format(
	account_conversation_relationship_table)
out.write("account_conversation_relationship table: {}\n".format(
	account_conversation_relationship_table))


print "-----------------------------------------------------------"
conversations_record = BIGINT + TIMESTAMP + BOOLEAN

print "conversation record: {}".format(conversations_record)
out.write("conversation record: {}\n".format(conversations_record))

conversations_count = 30000000000
print "conversations count: {}".format(conversations_count)
out.write("conversations count: {}\n".format(conversations_count))

conversations_table = conversations_record * conversations_count
print "conversations table: {}".format(conversations_table)
out.write("conversations table: {}\n".format(conversations_table))


print "-----------------------------------------------------------"
messages_record = BIGINT + BIGINT + INTEGER + TEXT(255) + BOOLEAN + TIMESTAMP

print "messages record: {}".format(messages_record)
out.write("messages record: {}\n".format(messages_record))

messages_count = 300000000000
print "messages count: {}".format(messages_count)
out.write("messages count: {}\n".format(messages_count))

messages_table = messages_record * messages_count
print "messages table: {}".format(messages_table)
out.write("messages table: {}\n".format(messages_table))
print "-----------------------------------------------------------"

total_size = users_table + accounts_table + account_types_table + statuses_table + \
	states_table + account_contact_list_relationship_table + contact_lists_table + \
	account_conversation_relationship_table + conversations_table + messages_table
print "total size in bytes: {}".format(total_size)
out.write("total size in bytes: {}\n".format(total_size))

KB = 2**10
MB = 2**10 * KB
GB = 2**10 * MB
TB = 2**10 * GB
SIZES = {
	'KB': KB, 
	'MB': MB, 
	'GB': GB, 
	'TB': TB
}

for size in SIZES:
	print "total size in {}: {}".format(size, round(float(total_size) / float(SIZES[size])))
	out.write("total size in {}: {}\n".format(size, round(float(total_size) / float(SIZES[size]))))

out.close()

