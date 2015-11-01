require_relative 'texting_twilio'

class Order

  attr_reader :basket, :texting_service

  def initialize(texting_service = TextingTwilio)
    @basket = {}
    @texting_service = texting_service
  end

  def add_to_basket(menu, dish_number, quantity)
    dish = menu.select(dish_number)
    @basket[dish] ||= 0
    quantity.times do
      @basket[dish] += dish.price
    end
  end

  def summary
    fail "Basket empty" if empty_basket?
    summary_string = ""
    basket.each_pair do |dish, cost|
      summary_string << "#{(cost / dish.price).round}x #{dish.name} | £#{format('%.2f', cost)}\n"
    end
    summary_string << "Total cost: £#{format('%.2f', total_cost)}"
  end

  def submit(payment)
    fail "Basket empty" if empty_basket?
    fail "Payment does not match total cost" if payment != total_cost
    issue_confirmation_text
  end

  private

  def total_cost
    (format('%.2f', basket.values.inject(0){|sum, cost| sum + cost} )).to_f
  end

  def empty_basket?
    basket.keys.count == 0
  end

  def issue_confirmation_text
    texting_service.send_text
  end

end