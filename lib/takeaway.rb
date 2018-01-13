require_relative './menu.rb'
require_relative './checkout.rb'
require 'forwardable'

class Takeaway

  extend Forwardable

  def_delegators :@menu, :viewmenu, :order, :basket
  def_delegators :@checkout, :check_order

  attr_reader :menu

  def initialize
    @menu = Menu.new
    @checkout = Checkout.new
  end

  def check_order
    @checkout.check_order(self.basket)
  end

end
