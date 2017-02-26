require_relative 'menu'
require_relative 'messenger'
require_relative 'order'

class Takeaway

  attr_reader :menu, :order, :order_history

  def initialize
    @menu = Menu.new
    @order = nil
    @order_history = []
  end

  def show_menu
    puts "MENU".center(40)
    print_dishes(@menu.menu)
  end

  def make_a_new_order
    @order = Order.new
  end

  def print_dishes(list)
    list.each_with_index do |item, index|
      puts "#{index + 1}. #{item[:dish]}, £#{item[:price]}"
    end
  end

  def select_dish(dish_number = 5)
    dish = @menu.select_dishes(dish_number)
    @order.order << dish
    puts "\nYou added #{dish[:dish]}."
    @order.order
  end

  def show_total
    puts "YOUR ORDER:".center(40)
    print_dishes(@order.order)
    puts "TOTAL: £#{@order.calculate_total}".center(40)
  end

  def confirm_order(messenger)
    raise "Please make an order!" if @order == nil
    @order_history << @order.order
    @order = nil
    messenger.send_confirmation("Thank you for your order! It will be delivered around #{Time.new.hour + 1}.#{Time.new.min}")
  end

end
