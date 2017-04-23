require 'twilio-ruby'

 module Twilio
   def client
     account_sid = 'ACefa15e1e0bdd4d4eb1345d8934866375'
      auth_token = '089ce732259bdecbdf0245f22a43d353'
      @client = Twilio::REST::Client.new account_sid, auth_token
   end
 end
