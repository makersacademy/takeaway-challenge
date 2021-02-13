require_relative 'menu'

class Order
  attr_reader :order_list, :total

  def initialize
    @order_list = []
    @total = 0
  end

def view_menu
  menu = Menu.new.list
end

end
