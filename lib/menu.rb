class Menu
  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def print_dishes
    printed_menu = dishes.map { |item, price|  "%s £%.2f" % [item.to_s.capitalize, price]}
    printed_menu.join(", ")
  end
end
