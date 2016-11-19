
class Order

attr_reader :order

def initialize
  @order = []
end

def add_item(number, takeaway)
@order << takeaway.menu_item(number)
end

end
