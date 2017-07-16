class Menu

  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def print_menu
    printed_menu = dishes.map{|name, price| "#{name.capitalize} £#{price}"}
  end

end
