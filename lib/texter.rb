require 'twilio-ruby'

class Texter
  def self.text(number)

   account_sid = 'AC4aae672be2a82fc5580e5401a6ade1a3'
   auth_token = '715791741fc525d16ae00a40b8dd0114'
   twilio_number = '+447481345653'
   confirmation = "Thank you, your order will be delivered by 18:52."

   @client = Twilio::REST::Client.new account_sid, auth_token

   @client.account.messages.create(
   from: twilio_number,
   to: number,
   body: confirmation
   )
 end

end
