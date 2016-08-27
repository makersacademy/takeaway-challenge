# understands how to place and confirm orders

require_relative 'dishes'
require_relative 'order'
require_relative 'dispatcher'

class Restaurant

  attr_reader :dishes, :dispatcher, :list, :sum, :current_order

  def initialize(dishes = Dishes.new, dispatcher = Dispatcher.new)
    @dishes = dishes
    @dispatcher = dispatcher
    @current_order = dispatcher.current_order
    @list = [[:chicken,1],[:spinach,3],[:potatoes,2]]
    @sum = 34
  end

  def available_dishes
    dishes.dishes
  end

  def place_order
    dispatcher.create_new_order(list,sum)
  end

  def confirm_order
    fail "Wrong total!" if dishes.check_sum(list, sum) == false
    dispatcher.current_order.confirm_order
    text_message.send(current_order)
  end

end
