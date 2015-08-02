require 'twilio-ruby'

class TwilioSender

  attr_reader :from, :client, :account_sid, :auth_token

  def initialize
    @from = "441767512027"
    @account_sid = 'AC60f704b617eb4d0f74dec894d219dcf3'
    @auth_token = 'c8757446a92df4de724fccdae07b7299'
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def send_text to, message
    message = @client.account.messages.create(
                                                body: message,
        to: to,
        from: @from,
        via: @client)
  end

end
