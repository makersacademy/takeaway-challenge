class Takeaway
  
  require './lib/menu.rb'
  require './lib/message.rb'

  attr_reader :order

  def initialize(menu: Menu.new)
    @menu = menu
    @order = []
  end

  def list_dishes
    @menu.list_items
  end

  def select(*selection, total)
    fail "Wrong total of items" if selection.count != total
    
    selection.each do |order_num|
      @order << @menu.item(order_num)
    end
  end

  def place_order
    fail "Basket is empty" if @order.length.zero?
    
    send_sms
  end

  def clear_basket
    @order = []
  end

  private

  def send_sms
    Message.new.send_sms
  end
end
