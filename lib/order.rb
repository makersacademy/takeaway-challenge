require_relative 'menu'

class Order
attr_reader :menu, :order_list

  def initialize
    @menu = Menu.new
    @order_list = []
  end

end
