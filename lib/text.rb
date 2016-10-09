require 'twilio-ruby'

class Text

  def confirmation(message)
  account_sid = 'AC4aabab7cc532cad62ca5e4f1d47a325f'
  auth_token = 'e687e78307554ed854869439e524aa64'
  @client = Twilio::REST::Client.new account_sid, auth_token
  @client.messages.create(
    from: "+4915735985245",
    to: "+4917623638417",
    body: message)
  end

  def send_message(message)
    confirmation(message)
  end

end
