require_relative 'menu'

# Understands how to aggregate food items from a menu
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
    "Added #{quantity} #{item.capitalize}(s) to your order."
  end

  def review_order
    subtotal = @menu.calculate_subtotal(@basket)
    output_review(subtotal)
  end

  def checkout(payment_amount)
    fail 'Please review payment amount' unless check_payment(payment_amount)
    puts 'Thank you for your order.'
  end

  private
  def check_payment(payment)
    @total.round(2) == payment.round(2)
  end

  def output_review(basket)
    basket.each do |i, q, s|
      puts "#{i.capitalize} x #{q} : $#{s.round(2)}"
    end
    puts "Total = $#{basket.map { |_i, _j, k| k }.inject(:+).round(2)}"
  end
end
