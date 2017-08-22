class Messager

  def time_in_an_hour
    t = Time.new + 3600
    t.strftime("%H:%M")
  end

  def create_message
    "Thank you! Your order was placed and will be delivered before #{time_in_an_hour}"
  end

  def send_message(client = Twilio::REST::Client)
    account_sid = 'AC297b79f096953ffb25e6c7a7554798b9'
    auth_token = 'c3fce4179277f9e78c5c5897cb1448aa'
    client_phone_no = '+447815793407'
    @client = client.new account_sid, auth_token
    @client.api.account.messages.create({
      :from => '+441158246050',
      :to => client_phone_no,
      :body => create_message,
    })
  end

end
