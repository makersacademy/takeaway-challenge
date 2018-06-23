class Basket
  attr_reader :orders

  def initialize
    @orders = []
  end

  def add(dish, amount, price)
    @orders << { dish: dish, amount: amount, price: price }
  end

  def show
    @orders.map do |order|
      amount = order[:amount]
      name = order[:dish]
      total = amount * order[:price]
      "#{amount} x #{name} - £#{'%.2f' % total}"
    end.join("\n")
  end
end
