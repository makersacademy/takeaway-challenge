require_relative 'menu'

class Order
  attr_reader :total
  attr_reader :menu

  def initialize
    @total = 0
    @menu = Menu.new
  end

end
