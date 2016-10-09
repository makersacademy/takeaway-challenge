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
    "#{quantity} #{item.capitalize}(s) have been added to your order."
  end

  def review_order
    subtotal = @menu.calculate_subtotal(@cart)
    output_review(subtotal)
  end

  def checkout(payment_amount)
    raise "Please review your payment" unless @total.round(2) == payment_amount.round(2)
    puts "Thank you for your order! Enjoy your meal!"
  end

  cart.each do |i, q, s|
    puts "#{i.capitalize} x #{q} : £#{s.round(2)}"
  end

  puts "Total = £#{cart.map { |_i, _j, k| k }.inject(:+).round(2)}"
end 
