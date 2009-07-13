# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_csrepo_v1_session',
  :secret      => 'aa8bd99a4137da833c0647cb047d0d100fbf6376d45411fbc4b49ce36faa92db003066a81741eb1e66372a077b8152dc73d2f38e2082c33b4630c65655a97287'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
