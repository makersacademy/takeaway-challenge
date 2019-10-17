require 'total'
require 'mainmenu'
require 'deliverytime'
class Order

  attr_reader :items

  def initialize(items = nil, menu = nil, total = nil, send = nil)
    @items, @menu, @customer_total, @customer_send = items, menu, total, send
  end

  def set_menu
    @dishes = @menu.dishes
  end

  def confirm_total
    @total = @customer_total.calculate(@items, @dishes)
  end

  def send
    @customer_send.send
  end
end
