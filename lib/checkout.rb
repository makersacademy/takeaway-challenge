require_relative 'order'
require 'till'

class Checkout

  include Till

  attr_reader :order

  def initialize (order)
    @order = order
  end

  def final_total
    total @order.dishes
  end

  def display_final_order
    display_order @order.dishes
  end

end