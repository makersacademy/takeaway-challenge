require 'twilio-ruby'
require 'dotenv'

class SendText
  attr_reader :client, :sid, :token, :twilio_number, :client_number
  Dotenv.load


  def send_message(text)
    send_sms(text)
  end

  private

  def send_sms(text)
    @client = Twilio::REST::Client.new(ENV['SID'], ENV['TOKEN'])

    @client.account.messages.create(
    	:from => ENV['TWILIO_NUMBER'],
    	:to => ENV['CLIENT_NUMBER'],
    	:body => text
    )
  end

end
