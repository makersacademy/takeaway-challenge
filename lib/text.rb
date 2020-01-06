require 'twilio-ruby'

class Text 

  account_sid = 'ACe0fa7275d0920ace47dc01624b2d32f4'
  auth_token = '258bbc60945a9c8bd5448f2328692b5d' #changed 
  @client = Twilio::REST::Client.new(account_sid, auth_token)

  def send_text
  @client.messages.create(
    from: "+14159341234",
    to: "+447952019946",
    body: "Hey there!"
  )
  end 

end 