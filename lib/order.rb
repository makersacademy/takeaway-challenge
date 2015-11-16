require_relative 'texting_twilio'

class Order

  attr_reader :basket, :texting_service

  def initialize(texting_service = TextingTwilio)
    @basket = {}
    @texting_service = texting_service
  end

  def add_to_basket(menu, dish_number, quantity)
    dish = menu.select(dish_number)
    initial_insert(dish)
    quantity.times do
      @basket[dish] += dish.price
    end
  end

  def summary
    fail "Basket empty" if empty_basket?
    readable_basket
  end

  def submit(payment)
    fail "Basket empty" if empty_basket?
    fail "Payment does not match total cost" unless payment_matches_total?(payment)
    issue_confirmation_text
    reset_basket
  end

  def empty_basket?
    basket.keys.count == 0
  end

  private

  def total_cost
    (format('%.2f', basket.values.inject(0){|sum, cost| sum + cost} )).to_f
  end

  def payment_matches_total?(payment)
    payment == total_cost
  end

  def issue_confirmation_text
    texting_service.send_text
  end

  def reset_basket
    @basket = {}
  end

  def initial_insert(dish)
    @basket[dish] ||= 0
  end

  def readable_basket
    basket_string = basket.each_pair.inject('') do |return_string, (dish, cost)|
      item = "#{(cost / dish.price).round}x #{dish.name} | £#{format('%.2f', cost)}\n"
      return_string << item
    end
    basket_string << "Total cost: £#{format('%.2f', total_cost)}"
  end

end