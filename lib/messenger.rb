require 'twilio-ruby'

class Messenger

  attr_reader :client, :from

  def initialize
    @client = Twilio::REST::Client.new "ACf3440f773fa43bf7fd4fb0ad846b291d", "b10715fb7dd10771d96375cf78e92d4d"
    @from = "+44 1639 262014"
  end

  def send_message(name, phone_number)
    @client.account.messages.create(
      :from => @from,
      :to => phone_number,
      :body => "Hey #{name}, you will receive your order at #{delivery_time}!"
    )
    puts "Sent message to #{name}"
  end

private

  def delivery_time
    "#{(Time.now + (60*60)).strftime("%H:%M")}"
  end
end
