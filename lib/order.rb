require_relative 'menu'
require_relative 'takeaway'
require_relative 'order'

class Order
attr_reader :menu

  def initialize()
    dishes = []
    @menu = Menu.new.list
  end

  def add(index)
    dishes << @menu.values[index-1]
  end

end
