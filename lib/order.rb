require_relative 'menu'
require_relative 'takeaway'


class Order

  attr_reader :receipt, :menu

  def initialize
    @receipt = {}
    @menu = Menu.new
  end


  def add(item, quantity)
    @receipt[item] = quantity
  end
end
