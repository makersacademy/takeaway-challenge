require 'twilio-ruby'

class SMS


  def send_sms
     account_sid = 'ACd268326a81162bbacb7d84216a8b7d67'
     auth_token =  'f8a6adaa76de9e0e19ce240c580d4886'
    #  twilio_phone_number = ENV['mattia']
     in1hr = (Time.now + 3600).strftime("%H:%M")
     message = "Your order has been confirmed! It will be delivered by #{in1hr}"
     @client = Twilio::REST::Client.new account_sid, auth_token

     @client.account.messages.create(
         from: '+441623272327',
         to: '+447415580694',
         body: "#{message}\n",
     )
   end
  #  export twilio_token=f8a6adaa76de9e0e19ce240c580d4886
  #  export twilio_sid=ACd268326a81162bbacb7d84216a8b7d67

  # def send_sms
  #   account_sid = ENV['Twilio_SID']
  #   auth_token = ENV['Twilio_token']
  #   @client = Twilio::REST::Client.new account_sid, auth_token
  #
  #   @client.account.messages.create(
  #       :body => "Thank you! Your order will be delivered before #{Time.now(+3600)}.",
  #       :to => "+447711562499",
  #       :from => "+443333440983")
  # end
end
