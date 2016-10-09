 # understands how to process an order

 class Order
   attr_reader :balance

   def initialize(balance=0)
     @balance = balance
   end

 end
