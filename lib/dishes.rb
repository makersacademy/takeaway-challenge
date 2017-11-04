require 'csv'

class Dishes


  attr_reader :menu

  def initialize
    @menu = []
  end


  def print_menu
    list_of_dishes
    print_each_dish
  end

  def selecting_dish(dish)
    dish.capitalize!
    list_of_dishes
    do_select(dish)
  end

private
  def do_select(dish)
    wanted_dish = @menu.select { |selected_dish| selected_dish.key(1) == dish.to_sym}
    wanted_dish[0]
  end

  def print_each_dish
    @menu.each do |dish_with_price|
      dish_with_price.each_pair do |dish, price|
        puts "#{dish} ----> #{price}£"
      end
    end
  end

  def list_of_dishes
    CSV.foreach('lib/dish_list.csv') do |line|
      dish = line[0]
      price = line[1]
      add_menu(dish.to_sym, price.to_f)
    end
  end

  def add_menu(dish, price)
    @menu << {dish=>price}
  end

end
