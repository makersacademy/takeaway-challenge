require_relative 'menu'

class Order
  attr_reader :menu , :basket

  def initialize
    @menu = Menu.new
    @basket = {}
  end

  def add(item, quantity)
    basket[item] = quantity
    "#{quantity} - #{item} has been added to your basket"
  end

  def price(item, quantity)
    price = quantity * menu.dishes[item].to_i
  end

end
