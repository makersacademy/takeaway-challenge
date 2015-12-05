require 'twilio-ruby'

class SendSms

  attr_reader :customers

  def confirmation_text
    sender
  end

  private

  def credentials(value)
    return account_sid = 'AC3c30852abaf447e0f8c4b51eb23b0d01' if value == :sid
    return auth_token = '5c5c4e416d9ac5b15ce57e0f12eb6d37' if value == :token
  end

  def sender
    @client = Twilio::REST::Client.new credentials(:sid), credentials(:token)
    from = '+441477652033'
    @customers = { "+447723929855": "William" }
    @customers.each do |key, value|
     message = @client.account.messages.create(
        from: from, to: key,
        body: "Thank you! #{value}, your order was placed and will be
              delivered before #{(Time.now+2700).strftime("%I:%M%p")}")
     puts "Message sent to #{value}"
    end
  end
end
