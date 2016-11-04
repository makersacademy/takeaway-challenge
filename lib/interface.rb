# require_relative "menu"
# require_relative "order"
# require_relative "interface"
#
# class Interface
#
#   def initialize(options_hash)
#     puts "Welcome to TexasTacos, y'all!"
#     @menu = options_hash.fetch(:menu, Menu.new)
#     @order_class = options_hash.fetch(:order, Order)
#     @current_order = nil
#     @interface
#   end
#
#   def show_menu
#     @menu.show_menu
#   end
#
#   def new_order
#     @current_order = @order_class.new(@menu)
#   end
#
#   def order(item = nil, quantity = 1)
#     current_order?
#     @current_order.add_to_order(item, quantity)
#   end
#
#   def review_order
#     current_order?
#     @current_order.review_order
#   end
#
#   def checkout(payment_amount = 0)
#     current_order?
#     @current_order.checkout(payment_amount)
#     @adapter.send_sms(create_message_online(payment_amount))
#     reset_current_order
#   end
#
#   # def check_mobile_orders
#   #   valid_orders = get_valid_orders
#   #   execute_orders(valid_orders)
#   #   @adapter.update_messages
#   #   puts "#{valid_orders.length} valid order(s) have been received and completed."
#   # end
#
#   private
#
#   def current_order?
#     fail "Please begin your order" if @current_order.nil?
#   end
#
#   def create_message_online(amount)
#     time = (Time.now + (60 * 60)).strftime('at %I:%M%p')
#     "Your order £#{aount} will be delivered at #{time}"
#   end
#
#   def create_message_text
#     time = (Time.now + (60 * 60)).strftime('at %I:%M%p')
#     "Thank you for ordering from your phone. Your food will be delivered at #{time}"
#   end
#
#   def execute_orders(valid_orders)
#     valid_orders.each do |order|
#       new_order
#       parse_orders(order[1])
#       @adapter.send_sms(create_message_text)
#       reset_current_order
#     end
#   end
#
#   def reset_current_order
#     @current_order = nil
#   end
#
#   def parse_orders(order_body)
#     order_body.split(', ').each do |item|
#       arr = item.split('-')
#       order.(arr[0],arr[1].to_i)
#     end
#   end
# end
