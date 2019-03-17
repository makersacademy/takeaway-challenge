class Menu
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def find_dish(dish_name)
    @dishes.each do |dish|
      return dish if dish.name == dish_name
    end
  end

  def print_menu
    puts "Today's Menu".center(20)
    @dishes.each { |dish| puts "#{dish.name} - £#{dish.price}".center(20) }
  end
end
