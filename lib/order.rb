require_relative 'menu'

class Order 
  attr_reader :basket, :menu

    
  def initialize(basket = Hash.new)
    @basket = basket
    @menu = Menu.new.list
  end

  def add_to_basket(item, quantity)
    @basket[item.to_sym] = quantity
    @basket
  end 

  def total_price
    total = 0
    @basket.each do |item, quantity|
      total += (@menu[item]*quantity)
    end 
  total
  end 

end

