require_relative 'menu'

class Order 

  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu.menu
  end

  def order_meal(*items)
    items.each do |item|
      if @menu.has_key?(item)
        p item
      else
        raise "that's not on the menu!"
      end
    end
  end

end