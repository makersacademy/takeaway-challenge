require "menu"

class Order

  attr_reader :list

  def initialize(list = [])
    @list = list
  end

  def choose(selection)
    selection.capitalize!
    @list << selection
  end

  def price
    prices = []
    sum = 0
    @list.each do |dish|
      prices.push Menu.new.menu[dish.to_sym]
    end
    p "help"
    prices.each {|x| sum += x}
    return sum
  end

end
