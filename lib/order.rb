require_relative 'menu'

class Order
  attr_reader :menu, :selection

  def initialize(menu = Menu.new)
    @menu = menu
    @selection = []
  end

  def add_to_order(dish, quantity)
    menu.each do |item|
      selection << item.merge({:quantity => quantity}) if item.value?(dish)
    end
  end
  
end  
