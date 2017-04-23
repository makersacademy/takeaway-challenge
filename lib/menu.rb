require 'csv'

class Menu

  attr_reader :list_of_dishes

  def initialize
    @list_of_dishes = {}
    load_menu
  end

  def add(dish_name, price)
    @list_of_dishes[dish_name] = price
  end

  def price(dish_name)
    @list_of_dishes[dish_name]
  end

  def load_menu(filename = "menu_list")
      CSV.foreach("/Users/peterbarcsak/Projects/takeaway-challenge/lib/#{filename}.csv") do |line|
      dish, price = line
      @list_of_dishes[dish.to_sym] = price.to_f
    end
  end
  
end
