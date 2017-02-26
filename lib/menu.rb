require_relative 'dish'
require_relative 'order'
require_relative 'sms'

class Menu

  require 'csv'

  attr_reader :current_order, :list

  def initialize
    @list = []
    load_menu
  end

  def view_menu
    @list.each { |item|
      puts "#{item[:number]}. #{item[:name]} - £#{item[:price]}"
      puts "#{item[:description]}"}
    return
  end

  def create_order
    @current_order = Order.new
  end

  def select_dish(number)
    fail "Please create an order before selecting dishes" if !@current_order
    current_order.add_dish(number, self)
  end

  def proceed_to_checkout
    current_order.print_basket
  end

  def place_order
    current_order.place_order
  end

  private

  def load_menu (filename = 'menu.csv')
    CSV.foreach(filename) do |line|
      number, name, description, price, type = line
      @list << {:number => number.to_i, :name => name, :description => description, :price => price, :type => type}
    end
  end

end
