class Menu
  # attr_reader :dishes

  def initialize
    @dishes = []
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

  def add_dish(dish)
    @dishes << dish
  end
end
