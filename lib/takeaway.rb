require_relative 'message'
require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :order

  def initialize(menu = Menu.new, order = Order.new)

    @menu = menu

    @order = order

  end

  def print_menu

    @menu.print_menu

  end

  def add_to_order(dish, quantity)

    fail 'Not part of the menu' unless @menu.in_menu?(dish)
    @order.add_to_order(dish, quantity)

  end

  def check_order

    total = 0
    @order.dishes_ordered.each do |dish, quantity|
      puts "#{dish}: #{quantity} --> £%.2f" % (@menu.dishes[dish] * quantity)
      total += (quantity * @menu.dishes[dish])
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
