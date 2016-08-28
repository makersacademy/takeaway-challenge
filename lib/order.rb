require_relative 'takeaway'
require_relative 'menu'
require_relative 'sms'

class Order

attr_reader :basket, :dishes

  def initialize
    @menu
    @dishes
    @basket = Hash.new(0)
    @item_total
  end

  def add_to_basket(name, quantity = 1)
    @basket[name] += quantity
    return "#{quantity} piece(s) of #{name} is added to the basket."
  end

  def total_price
    # @basket[name] + "x" + @basket[quantity] + "= £" + @dishes[name]x@basket[quantity]
  end

  private
  def each_total
  end
end
