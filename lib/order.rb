require_relative 'menu'
require_relative 'submission'

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
    selected_dish = { quantity: quantity, dish: name, price: price, subtotal: line_total }
    @selected_dishes << selected_dish
    puts "#{quantity}x #{name} added to your order"
  end

  def print_total
    "\u00A3#{total}"
  end

  def review(check_total = total)
    error_text = "Error: GRAND TOTAL does not match actual total value of dishes."
    actual_total = @selected_dishes.map { |dish| (dish[:price] * dish[:quantity]) }.sum
    raise error_text if (check_total != actual_total)

    order_summary = "" << "Order Summary:\n\n"
    
    @selected_dishes.each do |dish|
      order_summary <<  dish[:dish]
      order_summary <<  "\n\u00A3%0.2f each, x#{dish[:quantity]}, " % [dish[:price]]
      order_summary <<  "subtotal: \u00A3%0.2f\n\n" % [dish[:subtotal]]
    end

    order_summary << "GRAND TOTAL: #{print_total}".rjust(31)

    # Must be `puts` to stdout so that customer can see order summary
    puts order_summary

    # returns the string object for easier testing
    order_summary
  end

  def submit
    Submission.new(self)
  end

end
