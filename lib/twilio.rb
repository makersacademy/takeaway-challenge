#require 'twilio-ruby'

#class Messenger
#  account_sid = "ACea5bb4181914c5245611e44d450184c8"
#  auth_token = ""

#  @client = Twilio::REST::Client.new account_sid, auth_token
#  @time = (Time.now + (60*60)).strftime("%H:%M")

#  def send_text
#    @client.messages.create(
#        to: "+375293069300",
#      from: "+43676800505017",
#      body: "Thank you! Your order was placed and will be delivered before #{@time}.")
#  end
#end
