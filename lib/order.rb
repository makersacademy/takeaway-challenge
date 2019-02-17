require_relative 'menu'

class Order
  attr_reader :total, :selected_dishes

  def initialize
    @selected_dishes = Array.new
    @total = 0
  end

  def add(dish, quantity = 1)
    name = Menu::DISHES[dish - 1][:name]
    price = Menu::DISHES[dish - 1][:price]
    line_total = quantity * price
    @total += line_total
    @selected_dishes << { quantity: quantity, dish: name, price: price, subtotal: line_total }
    puts "#{quantity}x #{name} added to your order"
  end

  def print_total
    "\u00A3#{total}"
  end

  def review

    puts "Order Summary:"
    puts

    @selected_dishes.each_with_index do |dish, index|
      puts dish[:dish]
      puts "\u00A3%0.2f each, x#{dish[:quantity]}, subtotal: \u00A3%0.2f" % [dish[:price], dish[:subtotal]]
      puts
    end

    puts "GRAND TOTAL: #{print_total}".rjust(31)

    # In case I have to access from within Menu class DISHES variable:
    # Menu::DISHES.select{ |dish| dish.has_value?("Large Cola") }[0][:price]
  end

end
