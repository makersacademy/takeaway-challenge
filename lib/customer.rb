require_relative 'menu.rb'

class Customer

  include Menu

  attr_reader :mobile, :order

  def initialize(mobile)
    @mobile = mobile
    @order = []
  end

  def place_order(*args)
    args.each { |arg| order << arg }
    order.map! { |x| menu[x] }
  end

end
