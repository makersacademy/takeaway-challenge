class Order
  attr_reader :menu, :pending_order

 def initialize
    @menu = Menu.new.menu
    @pending_order = []
 end

 def new_order
   @pending_order = ["Salad", "Pasta", "Ice Cream", "Pepsi"]
 end

 def review_order
   @pending_order.all? {|item| hash.key? item}
 end

end
