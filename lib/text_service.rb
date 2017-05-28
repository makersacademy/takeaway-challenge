require 'twilio-ruby'
class TextService

  def send_text
  account_sid = "AC5a2bc2db27369b8a3032032b2093d804"
  auth_token = "e52be0e68048eb3ab72cf233fff871eb"

  @client = Twilio::REST::Client.new account_sid, auth_token

  @message = @client.messages.create(
    to: "+447732731745",
    from: "+441425600031",
    body: "Thanks! Your order will arrive by #{(Time.now + (60*60)).strftime("%H:%M")}"
  )
  end

end
