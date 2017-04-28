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

  def total
    item_totals.inject(:+)
  end

  private

  attr_reader :menu

  def item_totals
    menu_items.map do |item, quantity|
      menu.price(item) * quantity
    end
  end
  
end
