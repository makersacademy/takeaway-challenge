class Order
  attr_reader :current_order

  def initialize
    @current_order = []
  end

  def choose_dish(dish_name)
    @dish_name = dish_name
    store_dish(@dish_name)
    p "You can continue adding other dishes to your order"
    # input = gets.chomp
    # Order.new.choose_dish(dish_name) if input == "Yes"
  end

  private

  def store_dish(new_dish)
    @current_order << new_dish
  end
end
