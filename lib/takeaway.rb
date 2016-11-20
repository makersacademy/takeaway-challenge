require './lib/menu'
require './lib/SMS'

class Takeaway

  attr_reader :menu, :order, :basket

  include SMS

  DEFAULT_QUANTITY = 1

  def initialize(klass1, klass2)
    @menu = klass1.new
    @order = klass2.new
    @basket = []
  end

  def select_item(item, quantity = DEFAULT_QUANTITY)
    return "Not a valid item" if !in_menu?(item)
    "#{quantity}x #{item} added to your basket"
  end

  def add_to_basket(item, quantity)
    @basket << {:item=>item, :qty=>quantity}
  end

  def accept_order(total)
    puts "Thank you for your order: £" + total.to_s
    #send_sms
  end

  def in_menu?(item)
    @menu.menu_list.has_key?(item)
  end

  def calculate_total(basket)
    basket.each.inject(0) { |sum, line| sum + (@menu.menu_list[line[:item]] * line[:qty])}
  end



end
