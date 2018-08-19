require 'twilio-ruby'
class Messager
  attr_reader :account_sid, :auth_token
# needed att read and instant variable for instance to recognise the variables
  def initialize
    @account_sid = 'AC9c21a11caf4a1045f79f695742aae881'
    @auth_token  = 'a2669f5218a3e8f29703184280a528f7'
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

# argument send number?
# eta message - maybe other messages?
  def send_eta_text(receiver = '+447596529149')
    from = '+442476100950'
    to = receiver
    @client.messages.create(
      from: from,
      to: to,
      body: "your order will arrive at #{Time.now.hour + 1}:#{Time.now.min}"
    )
  end

end
