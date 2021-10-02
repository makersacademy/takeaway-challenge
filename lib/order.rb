require_relative 'menu'

class Order
  attr_reader :order, :total, :menu

  def initialize
    @menu = Menu.new
    @order = []
    @total = 0
  end

  def add(item)
    raise "#{item} is not on the menu" unless menu.item?(item)
    @order << item
  end

end
