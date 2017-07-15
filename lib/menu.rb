
class Menu
  attr_reader :dish_list

  def initialize(dish_list)
    @dish_list = dish_list
  end

  def print_menu
    i = 0
    dish_list.each do |dish, price|
      i += 1
      puts "#{i}. #{dish} - £#{price}"
    end
  end
end
