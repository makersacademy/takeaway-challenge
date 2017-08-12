require_relative './takeaway_app.rb'

class OrderItem

  attr_reader :dish_number, :quantity, :cost, :dish_name, :unit_cost

  def initialize(user_input)
    # user_input = STDIN.gets.gsub(/\n/,"")
    @dish_number = user_input.split[0]
    @dish_name = $menu[@dish_number.to_i - 1][:dish]
    @quantity = user_input.split[1]
    @unit_cost = $menu[@dish_number.to_i - 1][:price]
    @cost = @quantity.to_i * @unit_cost
  end

end
