require_relative 'menu'

class Order

  attr_reader :basket, :total

  def initialize
    @basket = Hash.new(0)
  end

  def add(dish, quantity)
    @basket[dish] += quantity
  end

  def order_summary
    @basket.each do |dish, quantity|
      return "#{quantity}: #{dish}"
    end
  end


  def cost(menu)
    @total = []
    basket.each{ |dish, quantity| @total << (menu.dishes[dish]* quantity) }
    (total.inject(:+))
  end
end
