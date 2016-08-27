# understands how to place and confirm orders

require_relative 'dishes'
require_relative 'order'
require_relative 'dispatcher'
require_relative 'message'

class Restaurant

  attr_reader :dishes, :dispatcher, :list, :sum, :message

  def initialize(dishes = Dishes.new, dispatcher = Dispatcher.new, message = Message.new)
    @dishes = dishes
    @dispatcher = dispatcher
    @message = message
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
    message.send_confirmation
  end

end
