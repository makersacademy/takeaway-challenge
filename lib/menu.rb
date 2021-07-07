class Menu

  attr_reader :list_of_dishes
  attr_reader :menu

  def initialize
    @list_of_dishes = []
    @menu
  end

  def add_dish(dish)
    @list_of_dishes <<  dish.dish_for_menu
    @list_of_dishes.flatten!
  end

  def view_menu
    @list_of_dishes.each do |dish|
      puts "Dish: #{dish[:dish]}, Price: #{dish[:price]}"
    end
  end

  def is_available?(dish)
    @list_of_dishes.any? {|dish| dish['dish'] == @dish_to_order}
  end
end
