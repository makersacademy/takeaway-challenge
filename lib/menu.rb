require 'csv'

class Menu
  attr_reader :menu_list, :price_list, :dish_list

  def initialize
    @menu_list = []
    @price_list = {}
    @dish_list = []
    load_menu
  end

  def print_menu
    title = "Kiran's cafe menu:"
    title + @menu_list.to_s
  end

  def load_menu
    CSV.foreach("menu.csv") do |line|
      dish, price = line
      @menu_list << "#{dish}, £#{price}"
      @price_list[dish.to_sym] = price.to_f
      @dish_list << dish
    end
  end

  def prices
    @price_list
  end

  def dishes
    @dish_list
  end

end
