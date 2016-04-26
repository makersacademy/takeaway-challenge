require_relative 'dish'
require_relative 'menu'
require_relative 'message'

class Order

  attr_reader :my_order

   def initialize(menu)
     @menu = menu.dishes
     @my_order = Array.new(0)
     @sum = 0
   end

   def add(dish, quantity)
   raise "Please order something from the menu!" if !(@menu.include?(dish))
   @my_order << {dish => quantity}
   "#{quantity}X #{dish} has been added to your basket"
   end

   def view_basket
     basket = ""
     @my_order.each do |item|
       item.each do |dish, quantity|
            price = quantity * @menu[dish]
            pounds = '%.2f' % price
           basket << "#{quantity}X #{dish} - £#{pounds}\n"
       end
     end
     basket
   end

   def total
     @my_order.each do |item|
       item.each do |dish, quantity|
         price = quantity * @menu[dish]
         @sum += price
       end
     end
     @total = "Your total is £#{amount_in_pounds}"
   end

   def checkout(amount)
     raise "Incorrect amount" if amount != @sum
   end

  private
  attr_reader :menu, :dishes


  def confirm(message = Message.new)
  message.send
  "Order has been placed. We will text you with the delivery time"
  end

  def amount_in_pounds
    '%.2f' % @sum
  end

end
