require_relative 'menu'

class CustomerOrder  

  attr_reader :order, :menu
  def initialize(menu = Menu.new)
    @menu = menu
    @order = {}
  end

  def add(item, quantity)
    @order = { item.to_sym => quantity }
    return "#{quantity} x #{item}(s) added to your basket"
  end
end








# './lib/customer_order.rb'