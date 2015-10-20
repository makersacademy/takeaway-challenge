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

  def check_total
    total = order.inject { |acc, num| acc + num }
    "Current order total is £#{total}0"
  end

end
