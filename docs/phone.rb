require 'twilio-ruby'
# info at www.twilio.com/console

class Phone

  attr_accessor :tally

  def initialize
    @tally = tally
  end

  def input_details
    puts "Input Account SID"
    @account_sid = gets.chomp
    puts "Input Auth Token"
    @auth_token = gets.chomp
    puts "Receiver's Phone Number"
    @phone = gets.chomp
    send
  end

  def time(delay = 1)
    time = Time.new
    hour = time.hour + delay
    hour >= 24 ? hour -= 24 : hour
    "#{hour}:#{time.strftime("%m")}"
  end

  def text_in_message
    "Your order will arrive at #{time} and is £#{@tally}. Enjoy our heavenly dishes!"
  end

  def send
    client = Twilio::REST::Client.new @account_sid, @auth_token
    @message = client.messages.create(
      body: text_in_message,
      to: @phone,
      from: "+447481362500")
    puts @message.sid
  end
end
