require_relative 'menu'

class Order
  def initialize(menu = Menu.new)
    @basket = Hash.new(0)
    @menu = menu
    @total = 0
  end

  def add_to_order(item, quantity = 1)
    @total += @menu.check_price(item) * quantity
    @basket[item.capitalize] += quantity
  end

  def review_order
    subtotal = @menu.calculate_subtotal(@basket)
    output_review(subtotal)
  end

  def checkout(payment_amount)
    raise 'Please review payment amount' unless @total == payment_amount
    puts 'Thank you for your order.'
  end

  private

  def output_review(basket)
    basket.each do |i, q, s|
      puts "#{i.capitalize} x #{q} : $#{s.round(2)}"
    end
    puts "Total = $#{basket.map{|i,j,k| k}.inject(:+)}"
  end

end
