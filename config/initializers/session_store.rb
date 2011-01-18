# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_start_session',
  :secret      => 'e913bdef80bf7b00a987f83e4e9e8e0701e9a99e7cf1b9cead9c16ad29a571e6bf569f650222f91c5911c1525232168911ae497b037756801f12c11af16b3aac'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
