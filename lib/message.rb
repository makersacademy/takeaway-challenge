require 'twilio-ruby'

class Message

  def initialize 
    account_sid = 'AC28b51837d71f1dc049a2ad0614******'
    auth_token = 'cd060e44a6c397a502de1eff56******'
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def confirmation_message(total)

    from = '+4477233148**' # Your Twilio number
    to = '+447908******' # Your mobile phone number

    @client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed at #{Time.now} 
    and will be delivered by by #{Time.now + 3600}. Your total is £#{total})"
    )
  end

end
