require_relative 'menu'

# Manages customer's basket
class Order
  attr_reader :basket, :total, :menu

  def initialize(menu = Menu)
    @basket = []
    @total = 0
    @menu = menu.new
  end

  def add_to_basket(item, num)
    return adjust_current_basket(item, num) if in_basket?(item)
    basket << { item: item, amount: num, price: price(item) * num }
  end

  def calculate_total
    return 'Basket is empty' if empty?
    @total = 0
    basket.each { |x| @total += x[:price] }
    "Basket total: £#{format('%.2f', total)}"
  end

  def basket_summary
    return 'Basket is empty' if empty?
    [basket, calculate_total]
  end

  private

  def price(item)
    menu.dishes[item]
  end

  def empty?
    basket.empty?
  end

  def adjust_current_basket(item, num)
    basket.map! { |order|
      order[:item] == item ? reorder(order, item, num) : order
    }
  end

  def in_basket?(item)
    basket.map { |orders| orders.values.include? item }.include?(true)
  end

  def reorder(order, item, num)
    { item: item,
      amount: num + order[:amount],
      price: (price(item) * (order[:amount] + num)).round(2) }
  end
end
