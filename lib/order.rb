require_relative 'menu'

class Order
  attr_reader :menu , :basket

  def initialize
    @menu = Menu.new
    @basket = {}
  end

  def add(item, quantity)
    basket[item] = quantity
    "#{quantity} - #{item} has been added to your basket"
  end

  def price(item, quantity)
    price = quantity * menu.dishes[item].to_i
  end

  def calculate_price
    basket.map { |item, quantity| price(item, quantity).to_i }.inject(:+)
  end

  def overview
    return 'Basket is empty' if basket.empty?
    basket.map { |item, quantity| "#{item} x#{quantity}: £#{price(item, quantity)}... "}
      .join + total
  end

  def checkout(price = 0)
    return 'Basket is empty' if basket.empty?
    return 'Wrong total' if wrong_total?(price)
    "Total price: £" + calculate_price.to_s
  end

  def reset
    @basket = {}
  end

  private
  def wrong_total?(price)
    calculate_price != price
  end

  def total
    'Total price: £' + calculate_price.to_s
  end

end
