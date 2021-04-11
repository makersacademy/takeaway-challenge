require 'twilio-ruby'

class Order
  attr_reader :order_list, :total, :menu

  def initialize(menu)
    @order_list = Hash.new(0)
    @total = 0
    @menu = menu
  end

  def add_to_order(item, number = 1)
    number.times { @order_list[item] += 1 }
    add_to_total(item, number)
  end

  def check_total
    str = "You have ordered:"
    @order_list.each { |item, count| str += " #{count} x #{item} (£#{look_up_price(item)} each)" }
    str += ". The total is £#{@total}."
  end

  def place_order
    send_sms
  end

  private
  def look_up_price(item)
    @menu[item]
  end

  def add_to_total(item, number)
    number.times { @total += look_up_price(item) }
  end

  def send_sms
    account_sid = ENV["TWILIO_SID"]
    auth_token = ENV["TWILIO_TOKEN"]
    client = Twilio::REST::Client.new(account_sid, auth_token)
  
    from = ENV["TWILIO_NUM"]
    to = ENV["MYNUMBER"] 

    client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered before #{eta}"
    )
  end

  def eta
    unformated = Time.new + 3600
    @eta = unformated.strftime("%H:%M")
  end
end
