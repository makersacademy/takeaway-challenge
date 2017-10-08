require_relative 'menu'

class Takeaway

  attr_reader :menu

  def initialize
    @menu = Menu.new
  end

  def read_menu
    @menu.dishes
  end

  def order(menu_item)
    @menu.dishes.each_key do |k|
      return k if k == menu_item
    end
  end

end
