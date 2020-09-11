require './lib/menu'
class Order
  attr_reader :order_price, :valid_item#, :current_order
  def initialize
    @menu = Menu.new
   # @basket = Basket.new
    @current_order = []
    @order_price = 0
  end

  def select(*items)
    fail "Please select at least one dish" if items.empty?
    items.each do |item|
    @menu.food_items.each do |dish_hash|
      @current_order << dish_hash if dish_hash[:food] == item


    end
  end
  
  
    
   
  end
    


end
