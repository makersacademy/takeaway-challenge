class Order
  attr_reader :basket, :prices
  def initialize
    @basket = {}
    @prices = []
  end

  def add(dish, price, quantity)
    basket_adder(dish, quantity)
    @prices << price * quantity
  end

  def total
    @prices.reduce(:+)
  end

  def summary
    items = []
    counter = 0
    @basket.each { |item, quantity|
      items << "#{item} x#{quantity} = $#{@prices[counter]}"
      counter +=1
    }
    "Your order: #{items.join(", ")}, total: $#{total}"
  end

  private

  def basket_adder(dish, quantity)
    if @basket.include?(dish)
      @basket[dish] += quantity
    else
      @basket[dish] = quantity
    end
  end
end
