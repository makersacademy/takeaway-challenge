class Menu
  def initialize(dishes:)
    @dishes = dishes
  end

  def display_menu
    @dishes.each do |number, dish|
      display_dish(number, dish)
    end
  end

  def display_dish(number, dish)
    dish_price = '%.2f' % dish.price
    dish_as_string = "#{number}. "\
      "#{dish.name} - £#{dish_price}"
    puts dish_as_string
  end

  def select(dish_no:)
    @dishes[dish_no]
  end

  private :display_dish
end
