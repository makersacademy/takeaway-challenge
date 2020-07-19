require_relative 'menu'
require_relative 'basket'
class Takeaway
  attr_reader :menu, :basket
  def initialize(menu = Menu.new, basket: Basket)
    @menu = menu.items
    @basket = basket.new
  end

  def check_menu
    @menu.each { |item| puts "#{item[:name]}: £#{item[:price]}." }
  end

  def select_item(menu_item, quantity = 1)
    fail "Item not on menu" if item_unavailable?(menu_item) 

    item =  @menu.find{|item| item[:name] == menu_item}
    item[:quantity] = quantity
    @basket.current_order << item
  end

  private

  def item_unavailable?(menu_item)
    @menu.find{|item| item[:name] == menu_item} == nil ? true : false
  end
end
    