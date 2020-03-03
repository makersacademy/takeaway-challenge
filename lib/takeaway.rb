require_relative 'order'
require_relative 'text'

class Takeaway

  DEFAULT_NUM = 1

  attr_reader :menu, :order, :text

  def initialize(menu:, order: nil, text: nil)
    @menu = menu
    @order = order || Order.new(menu)
    @text = text || Text.new
  end

  def print_menu
    @menu.show_menu
  end

  def place_order(dish, quantity = DEFAULT_NUM)
    @order.adds_item(dish, quantity)
  end

  def confirmation
    print_order
    complete_order(@order.total)
  end

  def sent_message
    @text.confirmation_message
  end

  def complete_order(price)
    correct_amount?(price) ? "The order is correct" : "The order is incorrect"
  end

  private

  def correct_amount?(price)
    @order.total == price
  end

  def print_order
    puts "Order\n----" 
    @order.order.each do |dish, quantity|
      puts "#{dish}: #{quantity}"
    end
    puts "Total: £#{@order.total}"
  end

end
