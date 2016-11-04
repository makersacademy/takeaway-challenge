require_relative 'menu'

class Order

  attr_reader :total

  def initialize(menu = Menu.new)
    @basket = Hash.new(0)
    @menu = menu
    @total = 0
  end

  def add_to_order(item, quantity = 1)
    @total += @menu.check_price(item) * quantity
    @basket[item.capitalize] += quantity
    "#{quantity} #{item.capitalize}(s) have been added to your order."
  end

  def review_order
    subtotal = @menu.calculate_subtotal(@basket)
    output_review(subtotal)
  end

  def checkout(payment_amount)
    fail "Please review your payment" unless @total.round(2) == payment_amount.round(2)
    puts "Thank you for your order! Enjoy your meal!"
  end
end
