require_relative 'menu'
class Restaurant
  attr_reader :menu, :orders

  def initialize
    @menu = {"Battered squid" => 5, "Rump steak" => 16, "Chips" => 2, "Merlot" => 5}
    @orders = []
    @total = []
  end

  def pretty_print
    @menu.each { |k, v| puts "#{k}: £#{v}" }

  end

  def show_menu
    @menu
  end

  def order(item)
    if @menu.has_key?(item)
      @orders << item
      # @total << @orders.values_at(item)
    else raise "Item not on the menu."
    end
  end

end
