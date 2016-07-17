require 'twilio-ruby'

class Texter

  def initialize
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def text(number)
   @client.account.messages.create(
   from: twilio_number,
   to: number,
   body: confirmation
   )
 end

private

 def confirmation
   time = Time.now + 60*60
   "Thank you, your order will be delivered by #{time.hour}:#{time.min}."
 end

 def account_sid
  'AC4aae672be2a82fc5580e5401a6ade1a3'
 end

 def auth_token
   '715791741fc525d16ae00a40b8dd0114'
 end

 def twilio_number
   '+447481345653'
 end
end
