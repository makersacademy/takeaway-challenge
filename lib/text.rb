require 'twilio-ruby'

class Text
  def initialize(args)
    @takeaway_name = args[:name]
    @takeaway_number = args[:number]
    @sid = args[:sid]
    @token = args[:token]
  end

  def send_confirmation(number)
    @client_number = number
    p @sid
    p @token
    p @takeaway_number
    p @client_number
    client = Twilio::REST::Client.new(@sid, @token)
    client.messages.create(from: @takeaway_number, to: @client_number, body: "Thank you! Your order with #{@takeaway_name} was placed and will be delivered before #{(Time.now + 3600).strftime("%k:%M")}")

  end
end
