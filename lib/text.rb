require 'dotenv/load'
require 'twilio-ruby'

class Text

  def initialize
    @client = Twilio::REST::Client.new ENV['SID'], ENV['TOKEN']
  end

  def send(body_message)
    begin
      message = @client.messages.create( body: body_message,  messaging_service_sid: ENV['MESSAGEID'], to: ENV['MYNUM'])
    rescue Twilio::REST::TwilioError => e
      puts e.message
    end
  end

end