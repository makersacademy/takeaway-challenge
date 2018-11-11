require 'twilio-ruby'

class Send_Sms

  def send_text_message(order_total)
    account_sid = 'ACce313cdc20d9b638b5a565e06b67f8de'
    auth_token = 'aef68e0ab5c3d1825d494385a73adccf'
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    message = @client.messages
      .create(
         body: "Total price: #{order_total}. Order confirmed! Your food will be delivered at #{Time.now + 3600}!",
         from: '+441212855678',
         to: '+44 7708 542475'
       )
  end

end
