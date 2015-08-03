require_relative './dish.rb'
require_relative './order.rb'
require 'terminal-table'

class Menu

  DEFAULT_MENU = {biriyani: 5.00, uk_curry: 6.00, cheeseburger: 4.00, pizza: 5.00, side_of_salmonella: 1.95}

  attr_reader :dishes

  def initialize
    @dishes = DEFAULT_MENU
  end

  def add_dish name, price
    dishes[name] = price
  end

  def show
    rows = []

    dishes.each do |dish, amount|
      row = [ dish, ("£" + (sprintf "%.2f", amount)) ]
      rows << row
    end

    table = Terminal::Table.new

    table.rows = rows
    table.title = "MENU"

    puts table
  end
end