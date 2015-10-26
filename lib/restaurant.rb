require_relative 'order'
require_relative 'menu'
require_relative 'message'


class Restaurant

  include Order

  attr_reader :order

  def initialize(menu_klass: Menu, taste: MENU)
    @order = {}
    @menu = menu_klass.new(taste)
  end

  def confirm_order
    self.send_message
  end

  def order_reset
    @order = {}
  end

end
