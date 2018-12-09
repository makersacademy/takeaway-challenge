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

  def total
    convert_to_prices
    @item_prices.reduce(0, :+)
  end

  private

  def convert_to_prices
    @item_prices = basket.map { |dish| @menu[dish] }
  end
end
