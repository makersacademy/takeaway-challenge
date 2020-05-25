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
  
  def total
    item_total.reduce(:+)
  end

  private
  attr_reader :menu

  def item_total
    dishes.map do |item, quantity |
      menu.price(item) * quantity
    end
  end
end

class NoItemError < StandardError; end  # write your own type of error. Inheritate the behavior of StandardError class.