require './lib/menu'
class Takeaway
  attr_reader :order, :total
  def initialize(menu_klass=Menu.new)
      @menu = menu_klass
      @order = []
      @total = 0
  end

  def list_dishes
    @menu.dishes.map{ |dish| "#{dish[:name]}: £#{dish[:price]}"}*", "
  end

  def add(item, quantity = 1)
    element = @menu.dishes.select{|dish| dish[:name] == item}
    element[0].store(:quantity, quantity)
    @total += ((element[0][:price])*(element[0][:quantity]))
    @order << element
    @order.flatten!
  end


end
