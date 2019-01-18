class Menu
  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def print_menu
    dishes.map do |food, price|
      "%s £%.2f" % [food.to_s.capitalize, price]
    end.join(", ")
  end



  # def price(dish)
  #   dishes[dish]
  # end

end

# As a customer
# So that I can check if I want to order something
# # I would like to see a list of dishes with prices
# dishes.map do |title, price|
#
#
# dish =
#   { "Chicken": 3.00 }
