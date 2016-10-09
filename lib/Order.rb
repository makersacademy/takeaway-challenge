require_relative 'menu'

class Order
  def initialize(menu = Menu.new)
    @cart = Hash.new(0)
    @menu = menu
    @total = 0
  end

  def add_to_order(item, quantity = 1)
    @total += @menu.check_price(item) * quantity
    @cart[item.capitalize] += quantity
  end

  def review_order
    subtotal = @menu.calculate_subtotal(@cart)
    output_review(subtotal)
  end

  def checkout(payment_amount)
    raise "Please review your payment" unless @total == payment_amount
    puts "Thank you for your order! Enjoy your meal!"
  end
  
end
