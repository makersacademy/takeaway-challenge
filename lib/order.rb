require 'twilio-ruby'

class Order
  attr_accessor :list, :menu, :message

  def initialize
    @list = Array.new
    @menu = Menu.new
    @message = nil
    account_sid = 'ACf5d19af71627eddbd1e5d6871a088f6a'
    auth_token = '9edeba7d3f3cec1fc0854c8e0312a9dd'
    @client = Twilio::REST::Client.new account_sid, auth_token


  end

  def add(dish, quantity)
    quantity.times do
      @list.push(dish)
    end
    puts "(x#{quantity}) #{dish} added to basket."
  end

  def total
    total = 0.0
    @list.each do |dish|
      total += @menu.price(dish)
    end
    p "The total is £#{total}"
    total
  end

  def finalise
    final = self.total
    time = Time.now + (60*60)
    time1 = time.strftime("%H:%M")
    @message = "Thank you! Your order was placed and will be delivered before #{time1}."
  end

  def send_text(text)
    @client.api.account.messages.create(
      from: '+441733530297',
      to: '+447828003315',
      body: @message
    )
  end

end
