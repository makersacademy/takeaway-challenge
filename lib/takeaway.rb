require_relative 'message'

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

    Message.new(prepare_message).send

  end

  def prepare_message

    delivery_time = (Time.new + 3600).strftime("%k:%M")
    "Thank you! Your order was placed and will be delivered before #{delivery_time}"
    
  end

end
