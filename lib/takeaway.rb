require_relative 'menu'
require_relative 'messenger'

class Takeaway

  attr_reader :menu, :order

  def initialize
    @menu = Menu.new
    @order = []
    @messenger = Messenger.new
  end

  def show_menu
    @menu.print_menu
  end

  def make_an_order(dish_number)
    @order << @menu.menu[dish_number.to_i - 1]
  end

  def show_total
    total = 0
    puts "YOUR ORDER:".center(40)
    @order.each_with_index do |item, index|
      puts "#{index + 1}. #{item[:dish]}, £#{item[:price]}"
      total += item[:price]
    end
    puts "TOTAL: £#{total}".center(40)
  end

  def confirm_order
    puts "Thank you for your order!"
    # sends text
  end

end
