require_relative 'menu'

class Takeaway

attr_reader :menu, :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = {}
  end

  def order(item, quantity = 1)
    item = item.downcase
    fail 'Not a menu item!' unless menu.on_menu?(item)
    basket.store(item, quantity)
    confirm(item,quantity)
  end

private

  def confirm(item, quantity)
    puts "#{quantity} #{item} ordered."
  end

end
