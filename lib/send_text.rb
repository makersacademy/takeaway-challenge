require 'twilio-ruby'
require 'envyable'
Envyable.load('./config/env.yml', 'development')

class SendText

  attr_reader :customers

  def confirmation_text
    sender
  end

  private

    def sender

      accountSID = ENV[accountSID]
      authToken = ENV[authToken]

      @client = Twilio::REST::Client.new accountSID, authToken

      from = ENV[usernumber]

      @customers = { :"+44712345" => :Chris }

      @customers.each do |key, value|
        message = @client.account.messages.create(
          :from => from,
          :to => key,
          :body => "Hey #{value}, thank you for ordering with us! Your order
           will be delivered by #{(time_stamp).strftime("%I:%M%p")}.  Enjoy!"

        )
        puts "Sent message #{value}"
      end
    end

    def time_stamp
      Time.now + (60 * 60)
    end
end
