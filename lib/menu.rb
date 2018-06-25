require 'csv'

class Menu
  ITEM_MAX_LENGTH = 50

  attr_reader :menu_array

  def initialize(path)
    @menu_array = fetch_menu_array(path)
  end

  def fetch_menu_array(path)
    row_array = CSV.read(path)
    row_array.map! { |row|
      { name: row[0], price: row[1], veggie: !!row[2] }
    }
  end

  def list_prices
    @menu_array.each.with_index { |item, index| prettify(item, index) }
  end

  def select(input)
    @menu_array[input - 1]
    # number?(input) ? @menu_array[input - 1] : find_first(@menu_array, input)
  end

  private

  def prettify(item, index)
    STDOUT.print "#{index + 1}. ".rjust(5)
    STDOUT.print item[:name].ljust(ITEM_MAX_LENGTH)
    STDOUT.puts item[:price].rjust(10)
  end
end
