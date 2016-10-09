require_relative 'menu'
require_relative 'calculate'

class Takeaway

  attr_reader :menu, :basket, :current_basket, :calculate

  def initialize
    @menu = Menu.new
    @basket = []
  end

  def read_menu
    @menu.print_menu
  end

  def add(menu_item, amount=1)
    individual_item = {menu_item => amount}
    @basket << individual_item
  end

  def show_basket
    @basket.each {|hash| hash.each {|k,v| print "#{v} x #{k} " }}
  end

end
