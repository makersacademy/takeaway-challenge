require_relative 'text'

class Order
  include Text
  attr_reader :orders
  def initialize(text_client = Text)
    @cost = 0
    @orders = []
    @text_client = text_client
  end

  def choose_dish(menu, dish, quantities)
    order = menu.show.find { |item| item[:dish] == dish }
    @orders << {dish: dish, price: order[:price], quantities: quantities}
  end

  def checkout
    calculate
    result = ''
    orders.map do |order|
      result += "#{order[:dish]}: #{order[:quantities]} * #{order[:price]} "\
      "= #{order[:quantities] * order[:price]} | "
    end
    result += "The total amount is £#{@cost}"
  end

  def cancel_orders
    @orders = []
  end

  def pay(amount, customer)
    fail 'You are not paying the exact amount' unless @cost == amount
    orders.each do |order|
      order[:paid] = true
      order[:created_at] = (Time.now).strftime("%b %e, %Y %H:%M")
    end
    @text_client.send_text_message(customer.name, customer.phone_number)
  end

  private

  def calculate
    price = orders.map { |order| order[:price] * order[:quantities]}
    @cost = price.inject(:+)
  end

end
