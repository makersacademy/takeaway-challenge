require 'twilio-ruby'

class Twiliosms

  def send_conferm_sms
    account_sid = "AC3c7f3add2a39566e305dbf7d80fd56db"
    auth_token = "986acafbb584afc7ae3e48993a88fe4f"

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: "Thank you! Your order was placed and will be delivered before #{Time.now.strftime '%I:%M %p'}",
        to: "",
        from: "+441827230490")
        #puts message.sid
  end

end
