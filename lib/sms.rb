require 'twilio-ruby'

class Sms


      def initialize
          @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['AUTH_TOKEN'])
      end

      def send_message(message)
          @client.account.messages.create({
             from:ENV['TWILIO_NUMBER'],
             to: ENV['MY_NUMBER'],   
             body: message
             })
      end
end
