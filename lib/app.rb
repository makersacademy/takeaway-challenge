
require 'rubygems'
require 'twilio-ruby'

def send
 account_sid = "AC328ae31fa3ea52b0e959f91cb768852b"
   auth_token = "26b09a22f0ff29abee49033df09f963f"
   client = Twilio::REST::Client.new account_sid, auth_token

   from = "+441494372428"

   client.account.messages.create{
   									:from => from,
   									:to => "+447824388248", 
  							 		:body => "Order confirmed!"
  							 		}

end