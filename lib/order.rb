require_relative 'dish'
require_relative 'menu'
require_relative 'message'

class Order

  attr_reader :my_order

   def initialize(menu)
     @menu = menu.dishes
     @my_order = []
     @sum = 0
   end

   def add(dish, quantity)
   raise "Please order something from the menu!" if !(@menu.include?(dish))
   @my_order << {dish => quantity}
   "#{quantity}X #{dish} has been added to your basket"
   end

   def view_basket
     @basket = ""
     @my_order.each do |item|
       item.each do |dish, quantity|
            price = quantity * @menu[dish]
            pounds = '%.2f' % price
           @basket << "#{quantity}X #{dish} - £#{pounds}\n"
       end
     end
     @basket
   end

   def total
     @my_order.each do |item|
       item.each do |dish, quantity|
         price = quantity * @menu[dish]
         @sum += price
       end
     end
     pounds = '%.2f' % @sum
     "Your total is £#{pounds}"
   end

   def checkout(amount)
     amount_to_pounds = '%.2f' % amount
     pounds = '%.2f' % @sum
     raise "Incorrect amount" if amount_to_pounds != pounds
     confirm if amount_to_pounds == pounds
   end

   def confirm(message_class = Message)
   message = message_class.new
   message.send
   "Order has been placed. We will text you with the delivery time"
   end

  private
  attr_reader :menu, :dishes

end
