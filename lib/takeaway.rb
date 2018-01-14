require_relative './menu.rb'
require_relative './checkout.rb'
require 'forwardable'

class Takeaway

  extend Forwardable

  def_delegators :@menu, :viewmenu, :order
  def_delegators :@checkout, :check_order, :complete_order

  attr_reader :menu, :checkout

  def initialize
    @menu = Menu.new
    @checkout = Checkout.new
  end

  def check_order
    @checkout.check_order(@menu.basket)
  end

  def complete_order
    @checkout.complete_order(@menu.basket)
  end

end
