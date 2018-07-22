require_relative 'menu'
require 'time'

class Order
  attr_reader :selections
  attr_reader :cost

  def initialize(menu = Menu.new)
    @menu = menu
    @selections = []
    @cost = 0
  end

  def print_menu
    @menu.menu.each do | meal, price |
      puts "#{meal}, £#{price}"
    end
  end

  def select(selection, number)
    raise "#{selection} is not on the menu" if @menu.menu[selection].nil?
    number.times {
      @selections << selection
      @cost += @menu.menu[selection]
    }
    puts "The total cost of your order is now £#{@cost}"
  end

  def remove(selection)
    raise "#{selection} was not previously selected" unless @selections.include?(selection)
    @selections.delete(selection)
    @cost -= @menu.menu[selection]
  end

  def view_selections
    raise 'No items have been selected' if @selections.length.zero?
    puts @selections
  end

  def confirm
    puts "Thank you for your order, your food will arrive at #{Time.now.hour}:#{Time.now.min + 30}"
  end
end
