require_relative 'menu'
require_relative 'print'
require_relative 'twilio_api'


class Takeaway
  include TwilioAPI
  include Print

  attr_reader :menu, :basket, :subtotal

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = Hash.new(0)
    @subtotal = 0
  end

  def read_menu
    print_menu
  end

  def order(item, quantity=1)
    fail 'Item not available' unless in_menu?(item)
    add_item_to_basket(item, quantity)
    print_order(item, quantity)
  end

  def total
    reset_subtotal
    calculate_subtotal
    print_total
  end

  def checkout(total)
    raise 'Conflict in total cost' unless total == subtotal
    text_customer
  end

  def view_basket
    print_basket
  end

  private

  attr_writer :subtotal

  def in_menu?(item)
    menu.dishes.has_key?(item)
  end

  def calculate_subtotal
    basket.each_pair { |_food, cost_quant| self.subtotal += cost_quant.reduce(:*) }
  end

  def add_item_to_basket(item, qty)
    qty.times { basket[item] = [menu.dishes[item], qty] }
  end

  def reset_subtotal
    self.subtotal = 0
  end

  def text_customer
    send_sms
  end

end
