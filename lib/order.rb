class Order
  attr_reader :basket, :total, :menu
  def initialize(menu = { "steak" => 12.50, "pasta" => 7, "fish" => 9 })
    @menu = menu
    @basket = []
    @total = 0
  end

  def add_to_basket(dish, number)
    raise "Sorry, #{dish} is not in the menu" unless @menu.has_key?(dish)
    @basket.push(dish, number)
  end
end
