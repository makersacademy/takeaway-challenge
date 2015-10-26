require './lib/menu'
require './lib/message'
class Takeaway
  attr_reader :order, :total
  def initialize(menu_klass, message_klass = Message)
      @menu = menu_klass
      @order = []
      @total = 0
      @new_message = message_klass
  end

  def list_dishes
    @menu.dishes.map{ |dish| "#{dish[:name]}: £#{dish[:price]}"}*", "
  end

  def add(item, quantity = 1)
    element = @menu.dishes.select{|dish| dish[:name] == item}
    fail "That item is not available" if element[0] == nil
    element[0].store(:quantity, quantity)
    @total += ((element[0][:price])*(element[0][:quantity]))
    @order << element
    @order.flatten!
  end

  def send_message
    list_order
    @new_message.new(@dishes, @total).send_message
  end

  def list_order
    @dishes = @order.each.map{ |dish| "#{dish[:name]}"}*", "
  end
end
