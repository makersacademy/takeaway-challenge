require_relative 'menu'
require_relative 'order'

class Total

  attr_reader :total

  def initialize(order)
    @total = 0
    @order = order
  end

  def calculate
    menu = Menu.new
    @total = 0
    @order.current_order.each do |item|
      if menu.menu.key?(item[0])
        @total += (item[1] * menu.menu[item[0]])
      end
    end
    @total
  end

  def show
    calculate
    "Total amount: £#{@total}"
  end


end