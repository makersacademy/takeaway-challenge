require './lib/menu.rb'
require './lib/calculate.rb'
require './lib/text.rb'

class Takeaway

  attr_reader :basket,  :list, :text

  def initialize(menu = Menu.new, sum = Calculate.new, text = Text.new)
    @basket = []
    @menu = menu
    @sum = sum
    @text = text
  end

  def menu
    @menu.list
  end

  def order(dish)
    @basket <<   @menu.list.select { |key| key[:name].include?(dish) }
  end

  def total
    @sum.total(@basket)
  end

  def check_out
    text.message
    @basket.clear
  end

  # private
t
end
