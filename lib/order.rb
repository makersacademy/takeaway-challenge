require_relative 'menu'

class Order
  attr_reader :menu, :order

  def initialize()
    @menu = Menu.new
    @order = []
  end

  def add(item,num)
    order << {item: item, num: num} 
  end
end