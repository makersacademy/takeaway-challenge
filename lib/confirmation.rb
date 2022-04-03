class Confirmation

  def send_text
    twilio_setup
    delivery_deadline = one_hour_from_now
    message = @client.messages
      .create(
        :body => "Thank you! Your order was placed and will be delivered before #{
          delivery_deadline}",
        :from => '+12677107250',
        :to => '+447462326497'
    )
    puts message.sid
  end

  private

  def twilio_setup
    require 'rubygems'
    require 'twilio-ruby'
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def one_hour_from_now
    time = Time.now
    in_one_hour_formatted_s = (time + 3600).strftime("%H:%M")
  end

end
