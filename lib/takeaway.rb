class Takeaway
  
  require './lib/menu.rb'
  require './lib/message.rb'

  attr_reader :order

  def initialize(menu: Menu.new)
    @menu = menu
    @order = []
    @total = 0
  end

  def list_dishes
    @menu.list_items
  end

  def select(*selection, total)
    fail "Wrong total of items" if selection.count != total
    
    selection.each do |order_num|
      @order << (order_num)
    end
  end

  def view_order
    @order.each do |item_code|
    puts @menu.item(item_code).map{|k,v| "#{k}: £#{v}"}  
    @total += @menu.item(item_code).values.first
    end
    "Total = £#{@total}"
  end

  def place_order
    fail "Basket is empty" if @order.length.zero?
    
    Message.new.send_sms(@total)
  end

  def clear_basket
    @order = []
    @total = 0
  end


end
