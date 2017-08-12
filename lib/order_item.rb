class OrderItem

  attr_reader :dish_number, :quantity

  def initialize(user_input)
    # user_input = STDIN.gets.gsub(/\n/,"")
    @dish_number = user_input.split[0]
    @quantity = user_input.split[1]
  end

end
