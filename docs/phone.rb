require 'twilio-ruby'
# info at www.twilio.com/console

class Phone

  def input_details
    puts "Input Account SID"
    @account_sid = gets.chomp
    puts "Input Auth Token"
    @auth_token = gets.chomp
    puts "Receiver's Phone Number"
    @phone = gets.chomp
    send
  end

  def send
    client = Twilio::REST::Client.new @account_sid, @auth_token
    @message = client.messages.create(
        body: "Hello from Ruby",
        to: @phone,
        from: "+447481362500")
    puts message.sid
  end
end
