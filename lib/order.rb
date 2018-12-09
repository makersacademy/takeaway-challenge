require "./data/menu_data"

class Order
  attr_reader :menu, :basket

  def initialize(menu = MENU)
    @menu = menu
    @basket = []
  end

  def add_to_basket(dish, amount = 1)
    amount.times { @basket << dish }
  end

  # def total
  #
  # end
end
