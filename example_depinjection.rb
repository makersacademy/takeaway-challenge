# original
# this has the Dishes and Order class instantiaed. This is more permanent
# because you can't choose what you pass in. 3 objects for th price of one, and they are linked. the takeaway object knows about the dishes and the order
def initialize
  @menu = Dishes.new
  @order = Order.new
end

# Dependency Injection
# this would look like:
# takeaway = Takeaway.new(Dishes.new, Order.new)
# this also allows you to double out either class in the tests

def initialize(menu = Dishes.new, order = Order.new)
  @menu = menu
  @order = order
  # inject as arguments
end



DI = dependency inverted


ᚹᚱᛘ ᛬ class FixedTakeaway
     |   def initialize
     |     @menu = Menu.new
     |     @order = Order.new
     |   end
     | end
=> :initialize
ᚹᚱᛘ ᛬ class Menu
     |   attr_reader :dishes
     |   def initialize
     |     @dishes = {thing: 4.99}
     |   end
     | end
=> :initialize
ᚹᚱᛘ ᛬ class Order
     | end
=> nil
ᚹᚱᛘ ᛬ takeaway = FixedTakeaway.new
=> #<FixedTakeaway:0x007feb6b14e138 @menu=#<Menu:0x007feb6b14e0e8 @dishes={:thing=>4.99}>, @order=#<Order:0x007feb6b14e048>>
ᚹᚱᛘ ᛬ class SMSOrder     #did the tests the wrong way round... but its fine.
     | end
=> nil
ᚹᚱᛘ ᛬ class DITakeaway
     |   def initialize(menu = Menu.new, order = Order.new)
     |     @menu = menu
     |     @order = order
     |   end
     | end
=> :initialize
ᚹᚱᛘ ᛬ takeaway = DITakeaway.new
=> #<DITakeaway:0x007feb6a183370 @menu=#<Menu:0x007feb6a183348 @dishes={:thing=>4.99}>, @order=#<Order:0x007feb6a183280>>
ᚹᚱᛘ ᛬ smstakeawy = DITakeaway.new(SMSOrder.new)
=> #<DITakeaway:0x007feb6a0f3888 @menu=#<SMSOrder:0x007feb6a0f38b0>, @order=#<Order:0x007feb6a0f3860>>
ᚹᚱᛘ ᛬
