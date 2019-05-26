require './lib/menu.rb'

class Order

attr_reader :list_of_dishes, :selected_items
def initialize(m = Menu.new)
 
  @list_of_dishes = m
  @selected_items = []
end
def view_dishes
  @item = @list_of_dishes.list
end

def select_dishes(item, quantity)
  @total = 0
  selection = @list_of_dishes.list.select do |hash|
    hash[:name] == item
  end
  @selected_items.push(selection[0])

  @selected_items.each do |hash|
    @total += (hash[:cost].to_i * quantity)
end
end

def total
  @total
end
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