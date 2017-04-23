require_relative 'menu'
require_relative 'text'
require_relative 'print'

class Restaurant
  include Text, Print, Menu
  attr_reader :menu, :orders

  def initialize
    @menu = {"Battered squid" => 5, "Rump steak" => 16, "Chips" => 2, "Merlot" => 5}
    @total = []
    @orders = []
    @orders_checked = []
  end

  def show_menu
    pretty_print_menu
  end

  def order(item)
    @total << @menu.values_at(item) && @orders << item if @menu.has_key?(item)
    raise "Item not on the menu." if !@menu.has_key?(item)
  end

  def total_price
    @total.flatten.inject(:+)
  end

  def show_order
  end

  def check_total
    @orders.each { |a| @orders_checked << @menu.values_at(a) }
    @orders_checked.flatten.inject(:+)
  end
end
