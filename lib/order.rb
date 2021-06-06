require_relative 'menu'

class Order

  attr_reader :basket, :count, :total

  def initialize
    @basket = { }
    @count = 0
    @total = 0
  end

  def add_to_basket (dish,amount)
    @basket[dish] = amount
  end

  def current_basket
    @basket
  end

  def count_item
    basket.each { |dish, amount| @count += amount }
    @count
  end

  def total_in_basket
    basket.each { |dish, amount| @total += (dish.price * amount)}
    @total
  end
end

  