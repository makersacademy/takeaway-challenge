
class Menu
  attr_reader :dish_list

  def initialize(dish_list)
    @dish_list = dish_list
  end

  def print_menu
    i = 0
    dish_list.each do |dish|
      i += 1
      puts "#{i}. #{dish.name} - £#{dish.price}"
    end
  end
end
