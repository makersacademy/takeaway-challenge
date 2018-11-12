require_relative 'Order'
require_relative 'Dish'
require_relative 'Output'

EMPTY_ORDER_ERROR = "Order is empty!"
TOTAL_MISMATCH_ERROR = "Provided total doesn't match order total!"
SUCCESSFUL_ORDER_MESSAGE =  "Thank you! Your order was placed "\
                            "and will be delivered before"

class Takeaway

  attr_reader :menu

  SET_MENU = [
    { name: "Chicken jalfrezi", price: 8.00 },
    { name: "Lamb bhuna", price: 9.00 },
    { name: "Boiled rice", price: 2.00 },
    { name: "Pilau rice", price: 2.50 },
    { name: "Plain naan", price: 2.50 },
    { name: "Peshwari naan", price: 3.00 },
    { name: "Poppadom", price: 0.50 }
  ]

  def initialize
    @menu = Array.new
  end

  def add_dish(name, price)
    @menu << Dish.new(name, price)
  end

  def populate_menu(menu = SET_MENU)
    menu.each do |dish|
      add_dish(dish[:name], dish[:price])
    end
  end

  def display_menu
    @menu.each do |dish|
      puts "#{dish.name}: #{number_to_currency(dish.price)}"
    end
  end

  def add_to_order(input)
    item, quantity = interpret_order_input(input)
    menu_item = menu.select { |dish| dish.name == item }.first
    raise "#{item} is not on the menu!" if menu_item.nil?
    @customer_order = current_order_check
    quantity.times { @customer_order.add_item(menu_item) }
  end

  def view_order(order = @customer_order)
    error_if_empty_order
    order.list_order.uniq.each do |item|
      quantity = order.list_order.count(item)
      name = item[0]
      cost = number_to_currency(item[1] * quantity)
      puts "#{quantity}x #{name} = #{cost}"
    end
  end

  def view_total(order = @customer_order)
    puts number_to_currency(order.give_total)
  end

  def current_order_check
    @customer_order.nil? ? Order.new : @customer_order
  end

  def remove_from_order(item)
  end

  def interpret_order_input(input)
    return [input, 1] unless input.chr.match?(/[[:digit:]]/)
    input_array = input.split(" ", 2)
    [input_array[1].strip, input_array[0].strip.to_i]
  end

  def error_if_empty_order
    raise EMPTY_ORDER_ERROR if @customer_order.nil?
  end

  def place_order(provided_total, output = Sms)
    error_if_empty_order
    raise TOTAL_MISMATCH_ERROR if provided_total != @customer_order.give_total
    @customer_order.confirm_order
    output.new(order_success)
  end

  def order_success
    time = @customer_order.delivery_time.strftime("%k:%M")
    SUCCESSFUL_ORDER_MESSAGE + time
  end

end

def number_to_currency(value, sign = "£")
  "#{sign}#{'%.2f' % value}"
end

def currency_to_number(value)
  value[0].match?(/[[:digit:]]/) ? value.to_f : value[1..-1].to_f
end
