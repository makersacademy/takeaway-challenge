require_relative 'menu'
require_relative 'takeaway'

class Order
  attr_reader :choice, :menu

  def initialize
    @choice = {}
    @tot_cost = 0
    @menu = Menu.new
  end

  def input_order(food, amount)
  end

  def summary
  end

  def value
  end

end
