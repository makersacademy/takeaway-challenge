require_relative 'menu'
require_relative 'basket'
require_relative 'textmessage'
class Takeaway
  attr_accessor :menu, :basket
  def initialize(menu = Menu.new, basket: Basket)
    @menu = menu.items
    @basket = basket.new
  end

  def check_menu
    @menu.each { |item| puts "#{item[:name]}: £#{item[:price]}." }
  end

  def select_item(menu_item, quantity = 1)
    fail "Item not on menu" if item_unavailable?(menu_item) 

    item = @menu.find { |food| food[:name] == menu_item }
    item[:quantity] = quantity
    @basket.current_order << item
  end

  def place_order(basket, total, text = TextConfirmation)
    fail "Incorrect total value" if total != basket_value(basket)

    text.new.send_message if total != 0
  end

  private

  def item_unavailable?(menu_item)
    @menu.find { |item| item[:name] == menu_item }.nil?
  end

  def basket_value(basket)
    basket_total = 0
    basket.current_order.each do |item| 
      menu_item = @menu.find { |food| food[:name] == item[:name] }
      basket_total += (menu_item[:price].to_f * item[:quantity])
    end
    basket_total
  end
end
    