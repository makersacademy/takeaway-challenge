require_relative 'menu.rb'
require './lib/order.rb'
require './lib/text.rb'


class Restaurant
  include Order
  attr_reader :menu, :order

  def initialize(menuklass)
    @menu = menuklass.new
    @order = {}
  end

  def reciept
    "Total cost: £#{total}\n - #{ind_total.join(", ")}"
  end

  private

  def in_stock?(dish)
    menu.items.key?(dish)
  end
end
