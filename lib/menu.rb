class Menu
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def list_dishes
    # puts "1. Pizza - 16"
    @dishes.each_with_index do |dish, idx|
      puts "#{idx + 1}. #{dish.name} - #{dish.price}"
    end
  end

  def add_dish(dish)
    @dishes << dish
  end
end