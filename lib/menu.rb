require_relative 'order'

class Menu

  MENU = [
    { name: "Butterbeer", price: 3 },
    { name: "Bertie Botts Every Flavour beans", price: 7 },
    { name: "Chocolate Frogs", price: 5 }
  ]

  def initialize(order = Order.new)
    @order = order
  end

  def see
    print_out
  end

  def choose(dish, quantity)
    dish_price_quantity = search_menu(dish, quantity)
    order.add(dish_price_quantity)
  end

  def confirm_order(customer_input_price)
    order.confirm(customer_input_price)
  end

  private

  attr_reader :menu, :order

  def search_menu(dish, quantity)
    dish_price_quantity = []
    MENU.each do |item|
      dish_price_quantity = item if dish == item[:name]
    end
    dish_price_quantity[:quantity] = quantity
    dish_price_quantity
  end

  def print_out
    line_width = 40
    three_new_lines
    puts "Hogwarts Train Trolley"
    one_new_line
    MENU.each_with_index do |dish, index|
      print "#{index + 1}. #{dish[:name]}:".ljust line_width
      puts " #{dish[:price]} sickles".rjust line_width
    end
    three_new_lines
  end

  def three_new_lines
    puts "\n\n\n"
  end

  def one_new_line
    puts "\n"
  end
end
