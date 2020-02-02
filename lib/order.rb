class Order
  attr_reader :basket, :menu
  
  def initialize(menu)
    @basket = Basket.new(menu)
    @menu = menu
  end

  def add(dish, quantity = 1)
    @basket.add(dish, quantity)
  end 

  def remove(dish, quantity = 1)
    @basket.remove(dish, quantity)
  end

  def total
    @basket.total
  end

  def summary
    @basket.summary
  end

  def pay(amount)
    raise "Payment amount incorrect" if amount != total

    "Payment of £#{amount} successful."
  end
end
