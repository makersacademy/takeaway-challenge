class Order
  attr_reader :items 
  def initialize 
    @items = []
  end

  def add_to_cart(item)
    items.push item
  end 

  def total 
    total_cost = 0
    items.each do |item|
      total_cost += (item[:price] * item[:quantity])
    end
    total_cost
  end 

  def check_total(number)
    total == number
  end 
end
