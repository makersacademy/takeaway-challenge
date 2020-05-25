class Order
  attr_reader :dishes

  def initialize(menu)
    @dishes = {}
    @menu = menu
  end

  def add(item, quantity)
    fail NoItemError, "#{item.capitalize} is not on the menu" unless menu.has_dish?(item)
    dishes[item] = quantity
  end
  
  private
  attr_reader :menu
end

class NoItemError < StandardError; end  # write your own type of error. Inheritate the behavior of StandardError class.