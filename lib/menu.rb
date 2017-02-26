require_relative 'dish'
require_relative 'order'

class Menu

  require 'csv'

  attr_reader :current_order, :list

  def initialize
    @list = []
    load_menu
  end

  def view_menu
    @list.each { |item|
      puts "#{item[:name]} - £#{item[:price]}" }
    return
  end

  def begin_order
    @current_order = Order.new
  end

  def select_dish(number)
    current_order.add_dish(number, self)
  end

  def proceed_to_checkout
    current_order.print_basket
  end


  private

  def load_menu (filename = 'menu.csv')
    CSV.foreach(filename) do |line|
      number, name, description, price, type = line
      @list << {:number => number.to_i, :name => name, :description => description, :price => price, :type => type}
    end
  end

end
