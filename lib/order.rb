$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'menu'
require 'basket'
require 'text_alert'

class Order

  attr_reader :order_menu, :order_basket

  def initialize(menu = Menu.new, basket = Basket.new)
    @order_menu = menu
    @order_basket = basket
  end

  def select_item
    print "Enter Item Number: "
    @item_num = $stdin.gets.chomp.to_i
    print "Enter Quantity: "
    @item_quant = $stdin.gets.chomp.to_i
    add_to_basket
  end

  def send_order
    raise "Error: order cost incorrect" unless @order_basket.check_total
    TextAlert.new.send_confirmation
  end

  private

  def add_to_basket
    order_basket.new_item({ item: order_menu.menu_items.find { |item| item[:item_num] == @item_num }[:item],
                          quantity: @item_quant,
                          cost: order_menu.menu_items.find { |item| item[:item_num] == @item_num }[:cost] * @item_quant })
  end

end
