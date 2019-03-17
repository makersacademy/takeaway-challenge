require 'menu'
require 'order'
require 'sms'

class Takeaway
attr_reader :order, :sms, :menu

  def initialize(order = Order.new, sms = nil, config = {})
 
    @order = order || Order.new(menu)
    @sms = sms || SMS.new(config)
    #this is order object
    # @total = 0
  end 


  def check_menu(all_dishes= Menu.new)
    @alldishes = all_dishes
    # p @dishes
    #@dishes is dishes class
    @alldishes.display_list

  end 

  def place_order(dishes)
    @order = dishes
    p @sms
    @sms.deliver
  end 

  def total(order)
    order.total
  end

end 