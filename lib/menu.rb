require_relative 'messaging'
require_relative 'menu_list'

class Menu

  attr_reader :order, :menu_list, :messaging

  def initialize
    @order = []
    @prices = []
    @menu_list = Menu_list.new
    @menu_list = menu_list
    @message = Messaging.new
  end

  def print
    menu_list.menu_list
  end

  def send_message

  end

  def item(number)
    @choice = menu_list.menu_list.slice(number-1)
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
