class Basket
  attr_reader :orders, :total

  def initialize
    @orders = []
    @total = 0
  end

  def add(dish, amount, price)
    orders << { dish: dish, amount: amount, price: price }
    add_price_to_total(amount, price)
  end

  def show
    orders.map do |order|
      amount = order[:amount]
      name = order[:dish]
      total = amount * order[:price]
      "#{amount} x #{name} - £#{'%.2f' % total}"
    end.join("\n")
  end
end

private

def add_price_to_total(amount, price)
  @total += (amount * price)
end
