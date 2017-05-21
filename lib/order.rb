require_relative "menu"

class Order
  attr_reader :list
  def initialize
    @list = Hash.new(0)
    @menu = Menu.new
  end

  def add(dish, amount = 1)
    @list[dish] += amount
  end

  def summary
    @list.map { |dish, amount| "#{dish} x#{amount} = #{@menu.dishes[dish]*amount}" }.join(", ")
  end

  def calculate_total
    '%.2f' % @list.map { |dish, amount| @menu.dishes[dish.to_sym] * amount }.sum
  end
end
