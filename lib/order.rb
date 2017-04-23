require_relative 'menu'

# Manages customer's basket
class Order
  attr_reader :basket

  def initialize
    @basket = []
  end

  def add_to_basket(item, num)
    item = item.downcase.capitalize
    return adjust_current_basket(item, num) if in_basket?(item)
    @basket << { item: item, amount: num, price: price(item) * num }
  end

  private

  def price(item)
    Menu::FOOD_MENU[item]
  end

  def adjust_current_basket(item, num)
    @basket.map! { |x| x[:item] == item ? reassign_value(x, item, num) : x }
  end

  def in_basket?(item)
    @basket.map { |orders| orders.values.include? item }.include?(true)
  end

  def reassign_value(x, item, num)
    { item: item,
      amount: num + x[:amount],
      price: (price(item) * (x[:amount] + num)).round(2) }
  end
end
