require './lib/takeaway'
require './lib/menu'

class Order

  attr_accessor :list, :add, :total

  def initialize
    @list = Hash.new
    @menu = Menu.new
  end

  def add(item, number = 1)
    @list.store(item, number.to_i)
  end

end
