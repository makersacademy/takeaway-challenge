require 'twilio-ruby'

class Sms

    ACCOUNT_SID = 'AC931d30987b9634469ecc155be9841575'
    AUTH_TOKEN = 'bc9c3e5accb217aacc6477415868dda3'

      def initialize
          @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
      end

      def send_message(message)
          @client.account.messages.create({
             from:'+441292388043',
             to: '+445647372254',   #not my real numer 
             body: message
             })
      end
end
