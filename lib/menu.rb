class Menu
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def display_menu
    dishes.each_with_index do |dish, index|
      puts "#{index + 1}. #{dish.name}, £#{dish.price}"
    end
  end

  def order_dish(number)
    raise 'please pick the dish number' unless number.is_a? Numeric
    raise 'please stick to numbers on the menu' if number > @dishes.length 
    return @dishes[number - 1]
  end

end
