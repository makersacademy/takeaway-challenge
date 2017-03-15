require 'order'

class Takeaway
def initialize(menu:, config:, order: nil, sms: nil)
  @menu = menu
  @order = order || Order.new(menu)
  @sms = sms || SMS.new(config)
end

def print_menu
  menu.print
end

def make_order(dishes)
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




# def menu
# menu = [ 'Edamame', 'Vegetabe spring roll', 'Salmon roll', 'Cucumber roll']
# end
#
# def price(food)
# menu[0] = 2
# menu[1] = 3
# menu[2] = 4
# menu[3] = 4
# end
