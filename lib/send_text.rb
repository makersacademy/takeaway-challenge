require 'twilio-ruby'

class SendText

  attr_reader :customers

  def confirmation_text
    sender
  end

  private

    def sender

      accountSID = 'AC8a18c4b3cf182c308e952100a2a8c1ab'
      authToken = '5e8d102aef932d5a67bcc4e786e0e084'

      @client = Twilio::REST::Client.new accountSID, authToken

      from = '+447919108936'

      @customers = { '+441233225155' => "Tristan" }

      @customers.each do |key, value|
        message = @client.account.messages.create(
          :from => from,
          :to => key,
          :body => "Hi #{value}! Your order will be delivered by #{(Time.now + 2700).strftime("%I:%M%p")}. Thanks for ordering with us and enjoy!"
        )
        puts "Sent message #{value}"
      end
    end
end
