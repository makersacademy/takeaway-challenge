require_relative 'menu'
require_relative 'price'
require_relative 'send_sms'

class Takeout
  attr_reader :order, :total_given

  def initialize
    @menu = Menu.new
    @order = []
    @total_given = 0
  end

  def show_menu
    @menu.menu_display
  end

  def add_order(food, quantity, price)
    raise "That is not on the menu!" unless @menu.menu_list.include?(food)

    @total_given += price
    quantity.times do
      @order << food
    end
  end

  def finish_order
    price = Price.new
    @true_total = price.food_conversion(@order)
    raise "Total given doesn't match true total." if @true_total != @total_given
    puts "Your total is £#{@true_total}. You have been sent a text to confirm."
    send_text
  end

  def send_text
    text = SendText.new
    text.send
  end

end
