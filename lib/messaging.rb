module Messaging

  def send_text
    account_sid = 'AC44dcaf48c2de912fea75b0e472225c50'
    auth_token  =  'e0e7f38e8db606f71a8a73fbab90169b'

    @client = Twilio::REST::Client.new account_sid, auth_token
    @message = @client.account.messages.create({:to   => '07737932693',
                                                :from => '+441173251558',
                                                :body => "Thank you! Your order was placed and will be delivered before #{get_time}"})
    puts 'You will receive a confirmation text shortly.'; sleep(1)
  end

  def get_time
    time = Time.new
      if time.min == (0..9)
        output = (time.hour + 1).to_s + ':0' + time.min.to_s
      else
        output = (time.hour + 1).to_s + ':' + time.min.to_s
      end
    output
  end

end