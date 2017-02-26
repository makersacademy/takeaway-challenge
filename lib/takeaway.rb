require_relative 'menu'
require_relative 'messenger'

class Takeaway

  attr_reader :menu, :order, :total

  def initialize
    @menu = Menu.new
    @order = []
    # @messenger = Messenger.new
    @total = 0
  end

  def show_menu
    @menu.print_menu
  end

  def make_an_order(dish_number = 5)
    @order << @menu.select_dishes(dish_number)
  end

  def show_total
    puts "YOUR ORDER:".center(40)
    @order.each_with_index do |item, index|
      puts "#{index + 1}. #{item[:dish]}, £#{item[:price]}"
      @total += item[:price]
    end
    puts "TOTAL: £#{@total}".center(40)
    total
  end

  def confirm_order(messenger)
    messenger.send_confirmation("Thank you for your order! It will be delivered in 1 hour.")
  end

end
