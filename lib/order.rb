class Order

  attr_reader :dishes

  def initialize
    @dishes = {}
    # @menu = menu
  end

  def add(dish, quantity)
    fail NoItemError, "This #{dish} is not on the menu!" unless menu.dish_exists?(dish)
    dishes[dish] = quantity
  end

  def total

  end

  private

  attr_reader :menu

end

class NoItemError < StandardError; end
