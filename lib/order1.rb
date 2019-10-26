require './lib/menu.rb'

class Order1

attr_reader :menu, :basket
def initialize(m = Menu.new)
  @menu = m
  @basket = []
 
end

def view_dishes
  @menu.list
end

def add_item(choosen_item, quantity)
  quantity.times { @basket << @menu.select_dishes(choosen_item) }
end

# def total_cost
#     total = 0
#     @basket.each do |hash|
#       total += hash[:cost].to_i
#     end
#     return total
#   end
  
end
# def total_cost
#   total = 0
#   @selected_items.each do |hash|
#     total += hash[:cost].to_i
#   end
#   return total
# end
# end

# m = Menu.new
# o = Order.new(m)
# o.select_dishes("biriyani", 2)
# #o.total_cost