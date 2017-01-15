require 'twilio-ruby'

class Text

  attr_reader :message

  def initialize
    @account_sid = 'AC9a1d50f8331660db7399b9b6e348b883'
    @auth_token = 'ed75b51b9f53324d5d125723fa870ec6'
    @message = 0
  end

  def send_message(total = 0)
    client_send(@message = generate_message(total))
    return @message
  end

private

  def generate_message(total = 0)
    "Thank you! Your order came to £#{total}. "\
    "You can expect your delivery at #{(Time.new + 3600).strftime('%I:%M%P')}"
    #reformat strftime
  end

  def client_send(message, client = Twilio::REST::Client)
    client.new(@account_sid, @auth_token).account.messages.create(
    :body => @message,
    :to => "+447970670390",
    :from => "+441133205565")
  end
end
