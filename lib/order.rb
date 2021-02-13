require_relative 'takeaway'
require_relative 'menu'
require_relative 'text_message'

class Order

  attr_reader :order_list, :menu, :textmessage

  def initialize
    @order_list = {}
    @menu = Menu::MENU
    @text = TextMessage.new
  end

  def add(item, quantity = 1)
    fail "Item is not on the menu" unless on_menu?(item)

    add_to_order_list(item, quantity)
  end

  def verify_order
    order_sum
  end

  def confirm_order
    @text.confirm
  end

  private

  def on_menu?(item)
    @menu[item.to_sym]
  end

  def order_sum
    @order_list.map do |item, quantity|
      @menu[item] * quantity
    end.sum
  end

  def add_to_order_list(item, quantity)
    if @order_list.include?(item.downcase.to_sym)
      @order_list[item.downcase.to_sym] += quantity
    else
      @order_list[item.downcase.to_sym] = quantity
    end
  end
end
