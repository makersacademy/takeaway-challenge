require './lib/menu.rb'

class Takeaway

attr_reader :basket, :list

  def initialize(menu = Menu.new)
    @basket = []
    @menu = menu
  end

  def menu
    @menu.list
  end

  def order(dish)
    @basket << @menu.list.select { |k| k[:name].include?(dish) }
  end

  def total
    total = 0
    @basket.each do |x, _y|
      total += x[:price]
    end
    total
  end
end
