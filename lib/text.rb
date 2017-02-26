class Text

  def send_confirmation_text(toNumber)
    account_sid = 'AC9f613d59d88fad7e00230b05302c5e35'
    auth_token = '7c71180c93f745df52a75f7ac7ba1ea2'
    fromNumber = '+441254790495'
    delivery_time = Time.now
    bodyText = "Thank you! Your order was placed and will be delivered before #{(delivery_time.hour + 1)}:#{delivery_time.min}"
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create({
        :to => "#{toNumber}",
        :from => '+441254790495',
        :body => "#{bodyText}", })
  end
end
