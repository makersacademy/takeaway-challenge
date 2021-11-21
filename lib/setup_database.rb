require_relative './database_connection'

def setup_env_database
  if ENV['ENVIRONMENT'] == 'test'
    setup_test_database
  else
    DatabaseConnection.setup('takeaway')
  end
end

def setup_test_database
  connection = DatabaseConnection.setup('takeaway_test')
  connection.query("TRUNCATE menu RESTART IDENTITY CASCADE;")
end
