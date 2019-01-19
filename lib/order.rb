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

def checkout
  @bill = @order_summary.map {|dish| takeaway.read_menu[dish]}
  # reduce (:+) to get the sum
end

end
