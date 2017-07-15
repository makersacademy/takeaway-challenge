class Menu
  attr_reader :dish_list

  def initialize(dish_list)
    @dish_list = dish_list
  end

  def print_menu
    dish_list.each do |dish|
      puts "- #{dish.name} - £#{dish.price}"
    end
  end

  def includes?(dish_name)
    dish_list.each do |dish|
      return true if dish.name == dish_name
    end
    false
  end


end
