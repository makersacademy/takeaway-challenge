class Text
  attr_reader :time

  def initialize (time = Time.now + 3600)
    @time = time
  end

  def self.send
    account_sid = "ACc62846ea6cd0ccef6201d60d5669b8d3" # Your Account SID from www.twilio.com/console
    auth_token = "38063e6515b226eed2ab0e7b94482534"   # Your Auth Token from www.twilio.com/console
    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: "Thank you! Your order will be delivered before #{time}",
        to: "+447780869533",    # Replace with your phone number
        from: "+441325952438")  # Replace with your Twilio number
    print "Thank you! Your order will be delivered before #{time}"
  end

end
