require_relative 'twilio_api'

class Order
  attr_reader :ordered_dishes, :dishes, :text_provider

  def initialize(menu)
    @ordered_dishes = {}
    @ordered_dishes.default = 0
    @dishes = menu.dishes
    @text_provider = TwilioAPI.new
  end

  def add(food, amount)
    fail 'Not on the menu!' unless dish_on_menu?(food)
    amount.times { @ordered_dishes[food] += 1 }
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

  def dish_on_menu?(food)
    dishes.keys.include?(food)
  end

  def number_of_dishes
    list = ordered_dishes.map { |food, number| "#{number} #{food}" }.join(', ')
    list = list.reverse.sub(',', 'dna ').reverse
    "So far, you have ordered #{list} sushi(s)."
  end

  def calculate_total
    ordered_dishes.map { |food, number| dishes[food] * number }.inject(0, :+)
  end
end
