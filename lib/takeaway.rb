class TakeAway
  attr_reader :order

  def initialize(menu_class:)
    @menu = menu_class
    @order = []
  end

  def display_menu
    menu.show
  end

  def choose_item(item, quantity)
    raise 'Cannot choose this item!' unless on_menu? item
    @order << { item: item, quantity: quantity }
  end

  private

  attr_reader :menu

  def on_menu?(item)
    menu.items.include? item
  end
end
