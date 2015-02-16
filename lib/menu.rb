class Menu

  attr_accessor :dishes

  def initialize
    @dishes = []
  end

  def add_item_to_menu(dish)
    @dishes << dish
    puts "#{dish.name} -- $#{dish.price}"
  end

  def print_menu
    @dishes.each do |dish, price|
      puts "#{dish.name} --- $#{dish.price} "
    end
  end

end