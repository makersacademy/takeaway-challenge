# hash out requires for non testing
# require_relative './takeaway_app.rb'
require_relative './menu.rb'
class OrderItem

  attr_reader :dish_number, :quantity

  def initialize(order_item_string) # (user_input)
    # user_input = STDIN.gets.delete("\n")
    @dish_number = order_item_string[0].to_i
    @quantity = order_item_string[2].to_i
    @menu = Menu.new
  end

  def dish_name
    @dish_name = @menu.return_dish_from_number(@dish_number)
  end

  def unit_cost
    @unit_cost = @menu.return_unit_cost_from_number(@dish_number)
  end

  def cost
    dish_name
    unit_cost
     @quantity * @unit_cost
  end

end
