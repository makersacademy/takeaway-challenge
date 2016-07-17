require './lib/menu'
require './lib/sms'

class Takeaway

  attr_reader :order, :basket, :subtotals

  def initialize(menu: Menu.new, sms: nil)
    @menu = menu
    @sms = sms || SMS.new
    @order = {}
    @basket = []
    @subtotals = []
  end

  def print_menu
    menu.print_list
  end

  def add_item(item: , quantity: )
    order.store(item,quantity)
  end

  def view_order
    print_basket
  end

  def total_cost
    calculate_total
    "Total: £#{@total}"
  end

  def place_order

    sms.delivery_message
  end

  private

  attr_reader :menu

  def print_basket
    order.each do |item,quantity|
    basket << "#{item} x #{quantity} = £#{"%.2f" % (subtotal(item,quantity))}"
    @basket_details = basket.join(" ")
    end
  end

  def subtotal(item,quantity)
  menu.find_item_cost(item) * quantity
  end

  def calculate_total
    order.each do |item,quantity|
      subtotals << (subtotal(item,quantity))
      @total = sum(subtotals)
    end
  end

  def sum(subtotal)
      "%.2f" % (subtotal.reduce(:+))
  end

end
