require_relative 'menu.rb'
require_relative 'sms.rb'

class Takeaway

  attr_reader :menu, :items, :expected_total, :total

  def initialize
    @menu = Menu.new
    @items = {}
  end

  def show_menu
    menu.show_menu
  end

  def add_item(item, quantity = 1)
    raise 'This item is not on the menu, please choose something else' if !Menu::MENU.has_key?(item)
    raise 'Quantity cannot be less than 1' if quantity < 1
    if @items.has_key?(item)
      @items[item] += quantity
    else
      @items[item] = quantity
    end
  end

  def pay(expected_total)
    calc_total
    @expected_total = expected_total
    raise 'This is the incorrect total, please try again' if @expected_total != @total
    text_confirmation
  end

  private

  def calc_total
    prices = []
    @items.each do |item, quantity|
      Menu::MENU.each do |dish, price|
        prices << quantity * price if item == dish
      end
    end
    @total = prices.reduce(:+)
  end

  def text_confirmation
    Sms.new
    puts 'Your order has been received and you will receive a text confirmation shortly'
  end

end
