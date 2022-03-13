class Menu
  def initialize
    @dishes = []
  end
  
  # Passes a Dish instance into the array
  # This allows all of the Dish methods to be called
  def add_dish(dish)
    @dishes << dish
  end

  def list_dishes
    @dishes.each do |dish|
      puts "#{dish.name} - #{dish.price}"
    end
  end

  def list_available_dishes
    @dishes.each do |dish|
      puts "#{dish.name} - #{dish.price}" if dish.available?
    end
  end

  def find_by_name(search_name)
    dish = @dishes.find { |dish| dish.name == search_name }
    puts 'No such dish' if dish.nil?
    dish
  end
end
