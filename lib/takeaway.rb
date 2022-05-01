require 'twilio-ruby'

class Takeaway

  attr_reader :order

  def initialize

    @menu = { "Apple Pie" => 4.5,
      "Banana Pie" => 4.5,
      "Tiramisu" => 5 }

    @order = {}

  end

  def print_menu

    @menu.each do |name, price|
      puts "#{name}: #{price}"
    end

  end

  def add_to_order(dish, quantity)

    fail 'Not part of the menu' unless dish_on_menu?(dish)
    @order[dish] = quantity

  end

  def dish_on_menu?(dish)

    @menu[dish]

  end

  def check_order

    total = 0
    @order.each do |dish, quantity|
      puts "#{dish}: #{quantity} --> £%.2f" % (@menu[dish] * quantity)
      total += (quantity * @menu[dish])
    end
    puts "--------------"
    puts "Total --> £%.2f" % total

  end

  def send_message

    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = ENV['TWILIO_PHONE'] # Your Twilio number
    to = ENV['MY_PHONE'] # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "Mensaje de prueba"
    )

  end

end
