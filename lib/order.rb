require_relative 'menu'

class Order

attr_reader :menu, :order_summary, :bill

def initialize(menu=Menu.new)
    @menu = menu
    @order_summary = []
end

def add_order(dish,number)
  number.times {@order_summary << dish }
end

end
