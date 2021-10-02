require_relative 'menu'

class Order
  attr_reader :order, :menu, :total

  def initialize
    @menu = Menu.new
    @order = []
    @total = 0
  end

  def add(item)
    raise "#{item} is not on the menu" unless menu.item?(item)
    @order << item
    calculate_total(item)
  end

  private

  def calculate_total(item)
    @total += menu.price(item)
  end

end
