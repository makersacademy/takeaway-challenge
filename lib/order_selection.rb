require_relative 'menu'
require_relative 'checkout'

class OrderSelection
  attr_reader :cart
  attr_accessor :menu

  def initialize(menu = Menu.new)
    @cart = []
    @menu = menu.the_menu
  end

  def add_item(item,quantity)
    raise "item does not exist" if !@menu.key?(:"#{item}")
    quantity.times {@cart.push(item)}
  end

  def remove_item(item,quantity)
    raise "Amount not available for removal" if @cart.count(item) < quantity
    quantity.times {@cart.delete_at(@cart.index(item))}
  end

  def view_cart
    v = 1
    @cart.each {|x| v = "#{@cart.count(x)} #{x}"}
    v
end

end
