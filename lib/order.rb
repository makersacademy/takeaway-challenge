
class  Order

  attr_reader :dishes

  def initialize(menu)
    @dishes = {} #Hash.new(0) create new hash with 0 add += quantity in add method
    @menu = menu
  end

  def add(dish, quanitiy) #same two arguments from the add_order method in take_away class
    fail NoItemError,"#{dish.capitalize} is not on the menu!" unless menu.has_dish?(dish) # #has_dish? method checks if menu has dish from #place_order
    dishes[dish] = quanitiy # += quanitiy if initialized hash with default (0)
  end

  private

  attr_reader :menu

end

class NoItemError < StandardError; end