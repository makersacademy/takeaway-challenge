require_relative 'menu.rb'
require_relative 'sms.rb'

class Takeaway

  attr_reader :items

  def initialize(menu_klass, sms_klass)
    @sms_klass = sms_klass
    @menu = menu_klass.new
    @items = Hash.new(0)
  end

  def show_menu
    menu.print_menu
  end

  def add_item(item, quantity = 1)
    raise 'This item is not on the menu, please choose something else' if !menu.has_item?(item)
    raise 'Quantity cannot be less than 1' if quantity < 1
    self.items[item] += quantity
  end

  def show_total
    calc_total
    @total
  end

  def pay(expected_total)
    calc_total
    raise 'This is the incorrect total, please try again' if expected_total != @total
    text_confirmation
  end

  private

  attr_reader :menu

  def calc_total
    prices = []
    self.items.each do |item, quantity|
      menu.dishes.each do |dish, price|
        prices << quantity * price if item == dish
      end
    end
    @total = prices.reduce(:+)
  end

  def text_confirmation
    sms = @sms_klass.new
    sms.send_confirmation
    'Your order has been received and you will receive a text confirmation shortly'
  end

end
