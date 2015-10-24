# class Takeaway
#
#   CHECKOUT_ERROR = "Total cost entered does not match the sum of your order!"
#
#   attr_reader :menu, :order
#
#   def initialize(menu = Menu.new, order = Order.new)
#     @menu = menu
#     @order = order
#   end
#
#   def read_menu
#     @menu.read
#   end
#
#   def place_order(itm, qty=1)
#     @order.add_to_basket(itm, qty)
#     "#{qty}x #{itm}(s) added to your basket."
#   end
#
#   def basket_summary
#     @order.basket_sum(@menu)
#   end
#
#   def total_cost
#     @total = @order.total_bill(@menu)
#     "Total Cost: £#{@total}"
#   end
#
#   def checkout(final_cost)
#     correct_amount?(final_cost) ? (send_text) : (raise CHECKOUT_ERROR)
#   end
#
#   private
#
#   def correct_amount?(final_cost)
#     final_cost == @total
#   end
#
#   def send_text(messenger = TextMessenger)
#     messenger.send_text
#   end
#
# end
#
#
# class Order
#
#   def initialize
#     @basket = Hash.new(0)
#   end
#
#   def add_to_basket(itm, qty)
#     @basket[itm] += qty
#   end
#
#   def basket_sum(menu)
#     @basket.each do |itm, qty|
#     print "#{itm} x#{qty} = £#{(menu.dishes[itm]*qty).round(2)}, "
#     end
#   end
#
#   def total_bill(menu)
#     total = []
#     @basket.each{ |itm, qty| total << (menu.dishes[itm]*qty).round(2) }
#     (total.inject(:+)).round(2)
#   end
#
# end
#
#
# class Menu
#
#   attr_reader :dishes
#
#   def initialize
#     @dishes = {"Spring Roll" => 0.99, "Fried Prawn" => 2.99}
#   end
#
#   def read
#     @dishes.each { |item, cost| print "#{item}: £#{cost}, " }
#   end
#
# end
#
# class TextMessenger
#
#   require 'twilio-ruby'
#
#   account_sid = 'AC2799c29662a04ae8f7eb70faa94e26c9'
#   auth_token = '34775ed3445ea0aa68c0734e8be2c829'
#
#   @client = Twilio::REST::Client.new account_sid, auth_token
#
#   def self.send_text
#     @client.account.messages.create({
#     	:from => '+441873740087',
#     	:to => '+447780330410',
#     	:body => "Thank you! Your order was placed and will be delivered before #{(Time.now + (60*60)).strftime("%H:%M")}"
#     })
#     "You will shortly receive an SMS confirming your order."
#   end
#
# end
