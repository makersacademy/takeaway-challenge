
class Takeaway
  attr_reader :menu
  attr_reader :current_order

  def initialize
    @menu = {bread: 5, apples: 2}
    @current_order = new_order
  end

  def select(item)
    @current_order[item.to_sym] += 1
  end

  def print_current_order
    order = ''
    @current_order.each{|item, quantity| order = order + "#{item}: #{quantity} " if quantity > 0}
    order = order.chop
    order
  end

  private

  def new_order
    Hash[@menu.map{|item , quantity| [item, 0]}]
  end



end
