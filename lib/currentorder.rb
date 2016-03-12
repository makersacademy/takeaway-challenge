require_relative 'order'

class CurrentOrder

  def initialize
    @current_order = {}
  end

  def new_item(item,value)
    @current_order[item] = value
  end



end
