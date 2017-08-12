require_relative './takeaway_app.rb'

class OrderItem

  attr_reader :dish_number, :quantity, :cost

  def initialize(user_input)
    # user_input = STDIN.gets.gsub(/\n/,"")
    @dish_number = user_input.split[0]
    @quantity = user_input.split[1]
    @cost = @quantity.to_i * $menu[@dish_number.to_i - 1][:price]
  end

end
