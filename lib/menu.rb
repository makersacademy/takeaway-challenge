require_relative 'messaging'
require_relative 'menu_list'

class Menu

  attr_reader :order, :menu_list

  def initialize
    # message = Messaging.new
    @order = []
    @prices = []
    @new_menu = Menu_list.new
  end

  def print_menu
    @new_menu
  end

  def item(number)
    @choice = menu_list.slice(number-1)
    @prices << @choice.last
    @order << @choice
  end

  def total
    @order = order
  end

  def prices
    @prices
    @prices.sum.round(2)
  end


end
