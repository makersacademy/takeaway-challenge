require_relative 'menu'

class Order
  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @selection = []
  end

  def add_to_order(dish, quantity)
    menu.select do |item|
      item[:quantity] = quantity if item.value?(dish)
      @selection << item if item.value?(dish)
    end
  end
end
