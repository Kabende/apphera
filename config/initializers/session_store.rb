# Be sure to restart your server when you modify this file.

#Appheradashboard::Application.config.session_store :cookie_store, key: '_appheradashboard_session'

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")

# for scalability store all sessions in the database.
Apphera::Application.config.session_store :active_record_store

Rails.application.config.session_store ActionDispatch::Session::CacheStore, :expire_after => 10.minutes

