
class Order

attr_reader :order, :price, :menu

 def initialize(menu = TakeawayMenu.new)
   @menu, @order, @price = menu, {}, 0
 end

 def add_item(name, quantity)
   @order[name] = quantity
 end

end
