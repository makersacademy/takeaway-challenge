class Sms
  def send_sms(order, time)
    require 'twilio-ruby'

    account_sid = "ACb2fdb625ae7da22b6887ec67f2c8faa7"
    auth_token = "14591596dfd70c675baae610b632dac8"

    @client = Twilio::REST::Client.new account_sid, auth_token

    @message = @client.messages.create(
      to: "+447926613228",
      from: "+441284277033",
      body: "Thank you! Your order of #{order} will be delivered by #{time.strftime("%H:%M")}. Enjoy!"
    )
  end
end
