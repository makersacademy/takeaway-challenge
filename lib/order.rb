
class Order

attr_reader :order

def initialize
  @order = []
end

def add_item(number, menu)
@order << menu.menu_item(number)
end

end
