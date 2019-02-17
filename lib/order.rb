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

  def review(check_total = total())
    puts "actual total: #{total}"
    puts "test total: #{check_total}"
    puts "print_total says: #{print_total}"


    error_text = "Error: Order aborted because GRAND TOTAL does not match actual total value of dishes."

    raise error_text if (check_total != @selected_dishes.map { | dish | (dish[:price] * dish[:quantity]) }.sum)

    order_summary = ""
    order_summary << "Order Summary:\n\n"
    
    @selected_dishes.each do |dish|
      order_summary <<  dish[:dish]
      order_summary <<  "\n\u00A3%0.2f each, x#{dish[:quantity]}, " % [dish[:price]]
      order_summary <<  "subtotal: \u00A3%0.2f\n\n" % [dish[:subtotal]]
    end

    order_summary << "GRAND TOTAL: #{print_total}".rjust(31)

    order_summary
  end

end
