require_relative 'takeaway'


# Start app by adding the following environment variables, then running ruby start.rb

creds = { account_sid: ENV['A_SID'], auth_token: ENV['AUTH_TOKEN'] , from_number: ENV['FROM_NUMBER'] }
takeaway = Takeaway.new(creds)
takeaway.start
