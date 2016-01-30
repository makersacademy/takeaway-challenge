require 'forwardable'

class Order

  extend Forwardable

  def_delegator :@menu, :list_items, :menu_items

  attr_reader :customer, :menu, :order_details

  def initialize customer, menu, order_details
    @customer = customer
    @menu = menu
    @order_details = order_details
    @items = []
    order_details.each do |i|
      @items << i unless menu_items.keys.include? i
    end
    fail "Sorry, we don't serve: #{@items.join(', ')}. Order aborted." unless @items.empty?
  end

  def total
    order_details.map {|i| menu_items[i]}.inject(:+)
  end

end
