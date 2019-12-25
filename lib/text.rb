require 'twilio-ruby'

class Text
  def send
    # put your own credentials here
    account_sid = 'AC335e55ee7a7e11ba978b9d86a0c4a24f'
    auth_token = 'f8c2febc1532775de9cd9b91f72ef6ca'
    # set up a client to talk to the Twilio REST API
      @client = Twilio::REST::Client.new account_sid, auth_token

      date_time = Time.now + 3600
      time = date_time.strftime("%H:%M")
      @client.messages.create(
        from: '+18506378703',
        to: '+447812758744',
        body: "'Thank you! Your order was placed and will be delivered before #{time}'"
      )
  end
end
