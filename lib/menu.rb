require_relative "./dish"
require_relative "./order"

class Menu

  def initialize
    @menulist = []
    @order = Order.new
  end

  def display
    @menulist.dup
  end

  def choose(dish, quantity)
    raise "Dish not in menu" unless @menulist.include?(dish)
    @order.read_dish(dish)
    @order.add_dish_to_order(quantity)     
  end

  def verify_order_total
    @order.verify_total
  end    

  def add_dish_to_menulist(dish)
    @menulist << dish
  end

  # def display_order_total
  #   @order.display_total
  # end

  # def display_order
  #   @order.display
  # end

  # private

  # def read_dish(dish)
  #   @last_selected_dish_name = dish.read_name
  #   @last_selected_dish_price = dish.read_price
  # end

  # def add_dish_to_order(quantity)
  #   @last_selected_ordered_dish = @dish_class.new(@last_selected_dish_name, 
  #     @last_selected_dish_price)
  #   @last_selected_ordered_dish.amount(quantity)
  #   update_total
  #   @order << @last_selected_ordered_dish
  # end

  # def update_total
  #   @total += @last_selected_ordered_dish.dish_total
  # end

end
