require_relative 'menu'

class Order

  attr_reader :list, :menu, :order, :total_cost

  def initialize(menu = Menu.new)
    @list = []
    @menu = menu
  end

  def read_menu
    @menu.display_menu
  end

  def choose(item)
   @choice = @menu.set_menu.select { |key, value| item.include? key }
   @list << @choice
   "You have added 1x #{item} to your order."
  end

  def total
    @list = @list.map{ |item| item.values }.flatten
    @total_cost = @list.inject{ |sum,x| sum + x }
    "The total cost is £#{@total_cost}."
  end

end
