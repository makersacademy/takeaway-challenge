class Menu
  attr_reader :list, :customer_order
  def initialize
    @list = { Burger: 5, Pizza: 10, Coke: 1 }
    @customer_order = {}
  end

  def order(*item)
    item.each do |element|
      fail 'Sorry, that item isn\'t on our menu' unless list.key?(element)
    end
    item.each { |element| customer_order[element] = list[element] }
  end
end
