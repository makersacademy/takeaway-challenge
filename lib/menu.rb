require 'csv'

class Menu
  CSV_PATH = './menu.csv'
  ITEM_MAX_LENGTH = 50

  attr_reader :menu_array

  def initialize
    @menu_array = CSV.read(CSV_PATH)
  end

  def list_prices
    @menu_array.each.with_index { |row, index| prettify(row, index) }
  end

  def select(input)
    @menu_array[input - 1]
    # number?(input) ? @menu_array[input - 1] : find_first(@menu_array, input)
  end

  private

  def prettify(row, index)
    STDOUT.print "#{index + 1}. ".rjust(5)
    STDOUT.print row[0].ljust(ITEM_MAX_LENGTH)
    STDOUT.puts row[1].rjust(10)
  end
end
