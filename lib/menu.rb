require './lib/dish'

class Menu

  attr_reader :list

  def initialize
    @list = []
  end

  def print_list
    return "These are our dishes and price: #{list_message}"
  end

  def add_dish(name, price, dish = Dish)
    @list << dish.new(name, price)
  end

  private

  def list_message
    display = []
    @list.each{|dish| display << "Dish Name: #{dish.name}, Price: #{dish.price}" }
    display.join(", ")
  end

end
