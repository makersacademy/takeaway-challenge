class Order 
  attr_reader :basket, :menu, :total, :phone_number 

    
  def initialize(basket = Hash.new)
    @basket = basket
    @menu = Menu.new.list
    @total = 0
    @phone_number = "+44"
  end

  def add_to_basket(item, quantity)
    @basket[item.to_sym] = quantity
    @basket
  end 

  def remove_item(item, quantity = nil)
    @basket.delete(item.to_sym) if quantity.nil? 
    @basket[item.to_sym] -= quantity unless quantity.nil?
    @basket
  end 

  def total_price
    @basket.each do |item, quantity|
      @total += (@menu[item] * quantity)
    end 
    @total
  end

  def complete_order
    fail "Nothing in basket" if @basket == {}
    Text.new
  end

end
