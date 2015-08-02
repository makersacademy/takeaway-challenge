require_relative 'twilio_api'

class Order
  attr_reader :order, :dishes

  def initialize(menu)
    @order = Hash.new(0)
    @dishes = menu.dishes
  end

  def add(food, amount)
    fail 'Not on the menu!' unless dishes.keys.include?(food)
    amount.times { @order[food] += 1 }
    number_of_dishes
  end

  def total
    total = calculate_total
    "The total amount is £#{total}."
  end

  def checkout(customer_input)
    if customer_input == calculate_total
      text_provider.text_message(customer_input)
      'Thank you for your order, a text message will be sent to you shortly.'
    else
      'That is not the correct amount.'
    end
  end

  private

  def text_provider
    TwilioAPI.new
  end

  def number_of_dishes
    list = order.map { |food, number| "#{number} #{food}" }.join(', ')
    list = list.reverse.sub(',', 'dna ').reverse
    "So far, you have ordered #{list} sushi(s)."
  end

  def calculate_total
    order.map { |food, number| dishes[food] * number }.inject(0, :+)
  end
end
