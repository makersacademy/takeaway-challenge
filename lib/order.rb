class Order

attr_reader :dishes

  def initialize(menu)
    @dishes = {}
    @menu = menu

  def add(dish, quantity)
    dishes[dish] = quantity
    raise NoItemError, "#{dish.capitalize} is not on the menu" unless menu.has_dish?(dish)
  end
end


private

attr_reader :menu
end

class NoItemError < StandardError; end 
