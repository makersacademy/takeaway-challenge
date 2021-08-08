require_relative 'menu'

class Order 
  attr_reader :basket, :menu

    
  def initialize 
    @basket = Hash.new
    @menu = Menu.new.list
  end

  def add_to_basket(item, price)
    @basket[item.to_sym] = price
    @basket
  end 

end

