class Order

  attr_reader :basket

  def initialize
    @basket = { }
  end

  def add_item_to_basket(dish, quantity)
    @basket[dish] = quantity
  end

  def total_price
    total = 0
    @basket.each do |item, quantity| 
      total += item.price * quantity 
    end
    total
  end
  
end