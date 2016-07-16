class Menu
  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def print_dishes
    printed_menu = dishes.map { |item, price|  "#{item.to_s.capitalize} £#{price}"}
    printed_menu.join(", ")
  end


end
