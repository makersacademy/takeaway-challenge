require 'csv'

class Menu
  CSV_PATH = './menu.csv'
  ITEM_MAX_LENGTH = 50

  attr_reader :menu_array

  def initialize
    @menu_array = CSV.read(CSV_PATH)
  end

  def list_prices
    @menu_array.each do |row|
      STDOUT.print row[0].ljust(ITEM_MAX_LENGTH)
      STDOUT.puts row[1].rjust(7)
    end
  end
end
