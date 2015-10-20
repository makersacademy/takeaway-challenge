require_relative 'menu.rb'
require './lib/order.rb'
require './lib/text.rb'
# require 'timecop'

class Restaurant
  include Order
  include Text
  attr_reader :menu, :order

  def initialize(menuklass, items)
    @menu = menuklass.new(items)
    @order = {}
  end

  def reset_order
    @order = {}
  end

  def receipt
    fail "Nothing in your order" if order.empty?
    "Thank you! Total cost: £#{'%.2f' % total} - #{ind_total.join(", ")}.
     It should arrive before #{arrival_time}".split.join(" ")
  end

  private

  def arrival_time
    time = Time.new
    (time + 3600).strftime("%H:%M")
  end

  def in_stock?(dish)
    menu.items.key?(dish)
  end
end
