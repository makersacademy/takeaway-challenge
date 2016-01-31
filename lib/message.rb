require 'twilio-ruby'


class Message

  def send_message(message)

  account_sid ='AC09169126869387fa7de484c4a6d71489'
  auth_token = '0986e11fcbba9286f87ac57dab26f205'
  @client = Twilio::REST::Client.new account_sid, auth_token
  from = "+33644607099"
  friends = { '+33661928033': "David Parry"}
    friends.each do |key, value|
      message = @client.account.messages.create(
                     from: from,
                     to: key,
                     body: "Thank you #{value}. " + message
                                                )
      puts "message sent"
    end
  end
end