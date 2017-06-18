require 'twilio-ruby'

class Sms

  attr_reader :send, :time, :total

  def initialize(total)
      @client = Twilio::REST::Client.new 'AC325f4aa232053fca5a1e7552bb2be471', 'cd1bb0267e886556dbb80afd79e4e6b7'
      @total = total
  end

  def order_time
    time = Time.new + 3600
    time.strftime("%R")
  end

  def send
    @client.messages.create(:body => "Thank you! Your order was placed and will be delivered before #{order_time}. The total was £#{total}.",
    :to => "+447376919213",
    :from => "+441728752067")
  end

end
