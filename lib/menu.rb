class Menu
  attr_reader :menu_array

  def initialize
    @menu_array = []
  end

  def add(name, price)
    dish = Hash.new
    dish[:name] = name
    dish[:price] = price
    @menu_array << dish
  end

  def show_menu_array
    @menu_array
  end

end
