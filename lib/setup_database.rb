require_relative './database_connection'

def setup_env_database
  p'env:'
  p ENV['ENVIRONMENT']

  if ENV['ENVIRONMENT'] == 'test'
    p 'into test'
    setup_test_database
  else
    DatabaseConnection.setup('takeaway')
    p 'not into test'
  end
end

def setup_test_database
  connection = DatabaseConnection.setup('takeaway_test')
  connection.query("TRUNCATE menu RESTART IDENTITY CASCADE;")
end
