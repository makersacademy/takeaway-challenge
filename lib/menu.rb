class Menu

  def initialize(dishes_list)
    @dishes_list = dishes_list
  end

  def get_list
    @dishes_list
  end

  def print_menu
    puts "Menu"
    @dishes_list.each_with_index do |dish, index|
      puts "#{index + 1}: #{dish.name} #{dish.price}£"
    end
  end

end
