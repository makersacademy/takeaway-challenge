require 'twilio-ruby'

class TwilioService

  def initialize(sid, auth_token, sender_number, receiver_number)
    begin
      @client = Twilio::REST::Client.new sid, auth_token
    rescue TwilioError => e
      puts e.message
    end
    @sender_number = sender_number
    @receiver_number= receiver_number
  end

  def createMessage(message)
    begin
      @client.messages.create(
        from: @sender_number,
        to: @receiver_number,
        body: message
      )
    rescue TwilioError => e
      puts e.message
    end
  end

end
