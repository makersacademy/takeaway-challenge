require_relative 'order'

class PriceCheck

  attr_reader :total, :menu

  def initialize
    @total = 0
  end

  def sum(order, menu)
    order.items.each { |i, q| self.total += (menu.list[i])*q }
    total
  end

  def verify(order)
    total == order.payment
  end

  private
  attr_writer :total

end
