require_relative 'menu'

class Order

attr_reader :menu, :order_summary

def initialize(menu=Menu.new)
    @menu = menu
    @order_summary = []
end

def add_order(dish)
  @order_summary << dish
end

end
