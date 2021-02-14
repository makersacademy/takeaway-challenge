class Basket
  attr_reader :items
  def initialize
    @items = Hash.new(0)  
  end 

  def add(dish, quantity = 1)
    @items[dish] += quantity
  end 

  def total(menu)
    total_price = 0
    @items.each do |dish, quantity| 
      total_price += menu.dishes[dish] * quantity
    end
    total_price
  end

end 
