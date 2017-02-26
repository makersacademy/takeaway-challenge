require_relative 'menu'
require_relative 'messenger'

class Takeaway

  attr_reader :menu, :order, :total

  def initialize
    @menu = Menu.new
    @order = []
    @total = 0
  end

  def show_menu
    @menu.print_menu
  end

  def make_an_order(dish_number = 5)
    dish = @menu.select_dishes(dish_number)
    @order << dish
    puts "You added #{dish[:dish]}, total: £#{calculate_total}."
  end

  def calculate_total
    @order.each do |item|
      @total += item[:price]
    end
    @total
  end

  def show_total
    puts "YOUR ORDER:".center(40)
    @order.each_with_index do |item, index|
      puts "#{index + 1}. #{item[:dish]}, £#{item[:price]}"
    end
    puts "TOTAL: £#{@total}".center(40)
  end

  def confirm_order(messenger)
    messenger.send_confirmation("Thank you for your order! It will be delivered in 1 hour.")
  end

end
