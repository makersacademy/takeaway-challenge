require 'rubygems'
require 'twilio-ruby'

class Message

  def send(message_body)
    twilio_send(message_body)
  end

  private

  ACCOUNT_SID = 'ACef4bd5f725088f1dd9765b16f0c2e694'
  AUTH_TOKEN = 'cdaa738b940ec6cc7c354c88a9ce16d7'
  CUSTOMER = "+46702204684"
  TWILIO_NR = "+46769439197"

  def twilio_send(message_body)
    begin
      @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
      message = @client.account.messages.create(:body => message_body,
      :to => CUSTOMER,
      :from => TWILIO_NR)
      puts message.sid
    rescue Twilio::REST::RequestError => e
      puts e.message
    end
    message_body
  end

end
