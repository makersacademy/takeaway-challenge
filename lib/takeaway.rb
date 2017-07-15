require_relative 'menu'
require_relative 'order'

class Takeaway
  attr_reader :items,:total, :calc_total


  def initialize(menu= Menu.new,order = Order.new)
    @menu = menu
    @order = order
    @total
    @items = {}

  end

  def menu
    @menu.list
  end

  def place_order(items,total)
    @items = items
    @total = total
  end

  def price
    calc_total= @order.calc_price(@items)
  end

  def check_total
    raise 'Sorry total does not match' if calc_total != @total
  end














end
