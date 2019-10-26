require_relative 'menu'
require_relative 'takeaway'


class Order

  attr_reader :basket, :menu

  def initialize
    @basket = {}
    @menu = Menu.new
  end


  def add(item, quantity)
    @basket[item] = quantity
  end
end
