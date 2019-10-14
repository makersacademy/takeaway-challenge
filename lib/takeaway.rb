require 'total'
require 'mainmenu'
require 'deliverytime'
class Order

  attr_reader :items

  def initialize(items = nil)
    @items = items
  end

  def set_menu
    @menu = MainMenu.new
    @dishes = @menu.dishes
  end

  def confirm_total
    customer_total = Total.new(@items, @dishes)
    @total = customer_total.calculate
  end

  def send(number)
    customer_send = DeliveryTime.new(number)
    customer_send.send
  end
end
