require_relative 'customer'
require_relative 'menu'

class Takeaway
  attr_reader :order

  def initialize(menu = Menu, customer = Customer)
    @menu = menu.new
    @customer = customer.new
    @order = []
    @total = 0
  end

  def see_dishes
    @menu.print_menu
  end

  def place_order
    item = what_would_you_like?
    quantity = how_many?
    price = @menu.find_price(item)

    add_to_order(item, quantity, price)
    update_total(price, quantity)

    place_order if anything_else?
  end

  def verify_order
    print_order
    return reset_order if order_wrong?

    text_confirmation
  end

  def print_order
    @order.each do |item|
      puts "#{item[:item]}(#{item[:quantity]}) ~ £#{item[:price]}"
    end
    print_total
  end

  def text_confirmation
    @customer.input_number
    @customer.send_confirmation
  end

  def reset_order
    @order = []
    return "Your order has been reset"
  end

  private

  def order_wrong?
    puts "Is everything correct? Y or N"
    answer = gets.chomp.upcase
    return false if answer == "Y"

    true
  end

  def update_total(price, quantity)
    @total += (price * quantity)
  end

  def print_total
    puts "TOTAL: £#{@total}"
  end

  def what_would_you_like?
    puts "What would you like to order?"
    gets.chomp
  end

  def how_many?
    puts "Input Quantity:"
    gets.chomp.to_i
  end

  def anything_else?
    puts "Anything else? Y or N"
    true_or_false?(gets.chomp.upcase)
  end

  def true_or_false?(choice)
    return true if choice == "Y"

    false
  end

  def add_to_order(item, quantity, price)
    @order << { item: item, quantity: quantity, price: price }
  end
end
