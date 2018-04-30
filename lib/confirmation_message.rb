require 'twilio-ruby'

module ConfirmationMessage

  attr_reader :confirmation_sms, :delivery_time

  def confirmation_sms

    account_sid = "ACdc2ef505e36ad493f65bb7dcf220d710"
    auth_token = "63a0e8ccd40ca519655b7429a66f9e1"

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: "Thank you! Your order was placed and will be delivered
        before #{delivery_time}",
        to: "+447899515870",
        from: "+441572842051")

    puts message.sid

    def delivery_time
      time = Time.new
      estimate_time = time.hour + 1
      output = "#{estimate_time}:#{time.min}"
      output
    end
  end
end
