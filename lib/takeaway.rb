require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :order_list

  def initialize(menu = Menu)
    @order_list = []
    @menu = menu.new
  end

end
