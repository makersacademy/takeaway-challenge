class Menu
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def list_dishes
    @dishes.each_with_index do |dish, idx|
      puts "#{idx + 1}. #{dish.name} - #{dish.price}"
    end
  end

  def list_available_dishes
    @dishes.each_with_index do |dish, idx|
      puts "#{idx + 1}. #{dish.name} - #{dish.price}" if dish.available?
    end
  end

  def add_dish(dish)
    @dishes << dish
  end
end
