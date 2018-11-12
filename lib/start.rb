require_relative 'takeaway'

creds = { account_sid: ARGV[0], auth_token: ARGV[1] , from_number: ARGV[2] }
takeaway = Takeaway.new(creds)
takeaway.start
