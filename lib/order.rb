class Order
  def initialize
    @current_order = []
  end

  def choose_dish(dish_name)
    @dish_name = dish_name
    @current_order << @dish_name
    p "Do want to add another dish to your order?"
    # confirm = gets.chomp
  end
end
