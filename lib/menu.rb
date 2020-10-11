class Menu
  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def full_menu
    dishes << Food.new('Pizza', 3)
    dishes << Food.new('Soup', 4)
  end

  def print_method
    dishes.each do |title, price|
    end
  end

  def print_format(food)
    puts "#{food.title} $#{food.price}"
  end

end
