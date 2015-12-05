require 'twilio-ruby'

class SendText

  attr_reader :customers

  def confirmation_text
    sender
  end

  private

    def sender

      accountSID = 'ACc7752d251c147e6953e3236fb686dc5b'
      authToken = 'f75cbc7b85d272abc00697c965f52795'

      @client = Twilio::REST::Client.new accountSID, authToken

      from = '+441183241104'

      @customers = { '+447838549907' => "Tony" }

      @customers.each do |key, value|
        message = @client.account.messages.create(
          :from => from,
          :to => key,
          :body => "Hey #{value}, thank you for ordering with us! Your order will be delivered by #{(Time.now + 2700).strftime("%I:%M%p")}.  Enjoy!"

        )
        puts "Sent message #{value}"
      end
    end
end
