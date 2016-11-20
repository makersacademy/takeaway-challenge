require './lib/menu'
require './lib/order'
require './lib/SMS'

class Takeaway

  attr_reader :menu, :order

  include SMS

  def initialize(klass1, klass2)
    @menu = klass1.new
    @order = klass2.new
  end

  # def validate_order
  #   return "Not a valid item" if !in_menu?(item)
  #   raise("Incorrect total") if
  # end



  def accept_order(basket, total)
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
