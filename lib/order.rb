require_relative 'menu'

class Order
 
  attr_accessor :order

  def initialize
    @order = []
  end

  def place(item, num)
    raise "Sorry we don't have this item at the moment!" unless Menu::MY_MENU.key?(item.to_sym)
    @order << { :item => item, :quantity => num }
  end

end