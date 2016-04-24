require_relative 'menu'

class Order

  attr_reader :my_order

   def initialize(menu)
     @menu = menu
     @dishes = menu.dishes
     @my_order = []
   end

   def view_menu
     @menu.read
   end

   def add(dish, quantity)
   raise "Please order something from the menu!" if !(@dishes.include?(dish))
   @my_order << {dish => quantity}
   "#{quantity}X #{dish} has been added to your basket"
   end

   def view_basket
     @basket = ""
     @my_order.each do |item|
       item.each do |dish, quantity|
            # get price from @menu with dish key * quantity of item
            price = quantity * @dishes[dish]
            # convert to 2 decimal place pounds
            pounds = '%.2f' % price
            # add to basket string
           @basket << "#{quantity}X #{dish} - £#{pounds}\n"
       end
     end
     @basket
   end

   def total
     @sum = 0
     @my_order.each do |item|
       item.each do |dish, quantity|
         # get price from @menu with dish key * quantity of item
         price = quantity * @dishes[dish]
         # add prices to sum
         @sum += price
       end
     end
     # convert to 2 decimal place pounds
     pounds = '%.2f' % @sum
     "Your total is £#{pounds}"
   end

   def checkout(amount)
     raise "Incorrect amount" if amount != @sum
     confirm if amount == @sum
   end

  private
  attr_reader :menu, :dishes

  # def confirm(message_class = Messenger)
  # message = message_class.new
  # time = Time.now
  # message.send(time)

  # end
  #


end
