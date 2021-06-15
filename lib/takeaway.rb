require 'order_takeaway'
require 'sms'

class Takeaway
    attr_reader :order

    def initialize(menu:, order: nil, sms: nil)
        @menu = menu
        @order = order || Order.new(menu) #order class passed in the menu
        @sms = sms || SMS.new
    end
  
    def print_menu  #menu object will use this print out method
      menu.print_out #calling menu object, from takeaway object to use this method
    end  
    
    def place_order(dishes)
        add_dishes(dishes)
        sms.deliver
        order.total
    end
private

  attr_reader :menu, :order, :sms

  def add_dishes(dishes)
    dishes.each do |dish, quantity|
      order.add(dish, quantity)
    end
  end 
end