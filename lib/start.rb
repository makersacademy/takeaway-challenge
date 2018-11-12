require_relative 'takeaway'


# Start app by running '$ ruby start.rb <twilio account sid> <twilio auth token> <phone number>'

creds = { account_sid: ARGV[0], auth_token: ARGV[1] , from_number: ARGV[2] }
takeaway = Takeaway.new(creds)
takeaway.start
