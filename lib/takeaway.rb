require_relative 'menu'

class Takeaway

  def initialize(menu_class = Menu)
    @menu = menu_class.new
    @basket_items = []
  end

  def menu
    @menu.show_menu
  end

  def order(item, number = 1)
    fail 'Item is not on menu' unless on_menu?(item)
    @basket_items << { item: number }
    "#{number} #{item}(s) added to your order"
  end

  def basket
    @basket_items.dup
  end

  private

  def on_menu?(item)
    @menu.show_menu.include?(item)
  end

end
