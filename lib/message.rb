require 'rubygems'
require 'twilio-ruby'
require 'dotenv'

class Message

  def send(message_body)
    Dotenv.load
    twilio_send(message_body)
  end

  private

  def twilio_send(message_body)
    begin
      @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
      message = @client.account.messages.create(:body => message_body,
      :to => ENV['CUSTOMER_NR'],
      :from => ENV['TWILIO_NR'])
    rescue Twilio::REST::RequestError => e
      puts e.message
    end
    message_body
  end

end
