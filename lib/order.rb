class Order

  attr_reader :menu_items

  def initialize(menu)
    @menu_items = Hash.new(0)
    @menu = menu
  end

  def add(item, quantity)
    fail "Sorry, #{item} is not on the menu, please make another selection!" unless menu.in_menu?(item)
    menu_items[item] += quantity
  end

  private

  attr_reader :menu

end
