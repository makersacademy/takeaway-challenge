class Order
  attr_reader :items 
  def initialize 
    @items = []
  end

  def add_to_cart(item)
    items.push item
  end 

  def total 
    total = 0
    items.each do |item|
      item_total = item[:price].to_i * item[:quantity].to_i 
      total += item_total
    end
    total
  end 
end 