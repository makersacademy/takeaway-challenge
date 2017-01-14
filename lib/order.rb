require_relative "menu"
require_relative "twilio"

class Order
  include Send_Message

  attr_reader :menu, :order, :item, :total

  def initialize(menu = Menu.new)
    @menu = menu
    @order = []
    @total = 0.0
  end

  def add_item(item)
    @item = item
    item_exists? ? add(item) : item_doesnt_exist
  end

  def check_order
    order
  end

  def check_total
    order.each do |menu_item|
      puts menu_item
    end
  end

  def complete_order
    send_message
  end

  private

  def item_exists?
    menu.menu.each {|menu_item| return true if menu_item[:item] == item[:item]}
    false
  end

  def item_doesnt_exist
    raise "Item does not exist: Please select a different item"
  end

  def add(new_item)
    @order << item
    unit = check_price(new_item)
    @total += unit
  end

  def check_price(new_item)
    unit = 0.0 ; quantity = 0
    menu.menu.each do |menu_item|
      next unless menu_item[:item] == new_item[:item]
      unit = menu_item[:price]
      quantity = new_item[:quantity]
    end
    unit * quantity
  end

  def send_message
    time = (Time.now + 1*60*60).strftime("%H:%M")
    send_text_message("Thank you! Your order was placed and will be delivered before #{time}")
  end
end
