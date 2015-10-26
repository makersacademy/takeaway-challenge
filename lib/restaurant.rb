require_relative 'order'
require_relative 'menu'



class Restaurant

  include Order

  attr_reader :order

  def initialize(dishes)
    @order = {}
    @menu = Menu.new(dishes).dishes
  end

  def confirm_order
    self.send_message
  end

  def order_reset
    @order = {}
  end

end
