class Restaurant
  
  attr_reader :dishes_with_prices, :sum, :order
  
  def initialize
    @dishes_with_prices = {
      'Green Tea' => 2,
    'Earl Grey' => 2,
    'Oat milk latte' => 3,
    'Cappucino' => 3,
    'Americano' => 2,
    'Espresso' => 2,
    'Hot Chocolate' => 3,
    'Chocolate muffin' => 1,
    'Lemon muffin' => 1,
    'Carrot cake' => 1 }
    @sum = 0
    @order = []
    
  end

  def list
    @dishes_with_prices 
  end

  def select(dishes)
    @order << @dishes_with_prices.select { |k, _v| k == dishes }
    @sum += @dishes_with_prices.fetch(dishes)
  end

  def total
    @sum
  end

  def ordered
    @order 
  end
  
  def text
    @text = "Thank you! Your order was placed and will be delivered before 18:00"
  end
end
