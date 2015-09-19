require_relative 'texting'

class Order

  attr_reader :basket

  def initialize
    @basket = {}
  end

  def add_to_basket(menu, dish_number, quantity)
    dish = menu.select(dish_number)
    quantity.times do
      if basket.keys.include?(dish)
        @basket[dish] += dish.price
      else
        @basket[dish] = dish.price
      end
    end
  end

  def summary
    fail "Basket empty" if empty_basket?
    basket.each_pair do |dish, cost|
      puts "#{(cost / dish.price).round}x #{dish.name} | £#{format('%.2f', cost)}"
    end
    puts "Total cost: £#{format('%.2f', total_cost)}"
  end

  def submit(payment)
    fail "Basket empty" if empty_basket?
    fail "Payment does not match total cost" if payment != total_cost
    issue_confirmation_text
  end

  private

  def total_cost
    (format('%.2f', basket.values.mick_inject(0){|sum, cost| sum + cost} )).to_f
  end

  def empty_basket?
    basket.keys.count == 0
  end

  def issue_confirmation_text
    Texting.send_text
  end

end