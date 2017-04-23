require_relative 'menu'

# Manages customer's basket
class Order
  attr_reader :basket, :total

  def initialize
    @basket = []
    @total = 0
  end

  def add_to_basket(item, num)
    return adjust_current_basket(item, num) if in_basket?(item)
    @basket << { item: item, amount: num, price: price(item) * num }
  end

  def calculate_total
    return 'Basket is empty' if empty?
    @total = 0
    @basket.each { |x| @total += x[:price] }
    "Basket total: £#{format('%.2f', @total)}"
  end

  def basket_summary
    return 'Basket is empty' if empty?
    [basket, calculate_total]
  end

  private

  def price(item)
    Menu::FOOD_MENU[item]
  end

  def empty?
    @basket.empty?
  end

  def adjust_current_basket(item, num)
    @basket.map! { |order|
      order[:item] == item ? reorder(order, item, num) : order
    }
  end

  def in_basket?(item)
    @basket.map { |orders| orders.values.include? item }.include?(true)
  end

  def reorder(x, item, num)
    { item: item,
      amount: num + x[:amount],
      price: (price(item) * (x[:amount] + num)).round(2) }
  end
end
