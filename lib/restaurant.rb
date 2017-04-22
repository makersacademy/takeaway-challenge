require_relative 'menu'
class Restaurant
  attr_reader :menu, :orders

  def initialize
    @menu = {"Battered squid" => 5, "Rump steak" => 16, "Chips" => 2, "Merlot" => 5}
    @total = []
    @orders = []
    @orders_checked = []
  end

  def pretty_print
    @menu.each { |k, v| puts "#{k}: £#{v}" }
  end

  def show_menu
    @menu
  end

  def order(item)
    if @menu.has_key?(item)
      @total << @menu.values_at(item)
      @orders << item
    else raise "Item not on the menu."
    end
  end

  def total_price
    @total.flatten.inject(:+)
  end

  def check_total
    @orders.each { |a| @orders_checked << @menu.values_at(a) }
    @orders_checked.flatten.inject(:+)
  end

end
