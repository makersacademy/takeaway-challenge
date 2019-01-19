require_relative 'menu'

class Order

attr_reader :menu, :order_summary

def initialize(menu=Menu.new)
    @menu = menu
    @order_summary = []
end

def add_order(dish,number)
  number.times {@order_summary << dish }
end

def checkout
  # run dish name in order summary and check for its value => array
  # reduce (:+) to get the sum
end

end
