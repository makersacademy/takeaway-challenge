require_relative 'menu'
require_relative 'basket'

class TakeAway #the user interface
  attr_reader :basket, :menu
  attr_writer :basket


  def initialize(menu = Menu.new, basket = Basket.new)
    @menu = menu
    @basket = basket
  end

  def read_menu
    @menu.list_items
  end

  def order(item, quantity = 1)
    raise "That item is not on the menu. Try another dish." unless menu.list_items.key?(item)
    notify(item, quantity)
    basket.items << {item => quantity}
  end

  def notify(item, quantity)
    puts "#{quantity}x #{item}(s) added to your basket."
  end

end
