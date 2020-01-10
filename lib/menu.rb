
class Menu

  attr_reader :dishes

  def initialize(dishes)
    @dishes     = dishes
  end

  def print_menu
    @dishes.map { |item,price| "%s: £%.2f" % [item.capitalize, price]  }.join(", ")
  end

  def has_dish?(dish)
    !dishes[dish].nil?
  end

  def price(dish)
    dishes[dish]
  end

end