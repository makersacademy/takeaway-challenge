class Menu
  attr_reader :dishes
  def initialize
    @dishes = []
  end

  def add_to_menu(dish)
    @dishes << dish
  end

  def show_menu
    @dishes.each do |dish|
      puts "Dish Name: #{dish.name} - Price: £#{dish.price}"
    end
  end

  def on_menu?(dish)
    @dishes.include?(dish)
  end 
end
