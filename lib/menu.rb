require 'csv'

class Menu

  CSV_FILENAME = 'lib/menu.csv'

  def initialize
    @menu = load_csv

  end

  def load_csv
    output = []
    f = File.absolute_path(CSV_FILENAME)
    CSV.foreach(f) do |row|
      food, price = row
      output << menu_entry_maker(food,price)
    end
    output

  end


  def view
    menu.dup
  end

  def menu_entry_maker(food,price)
    {
      food: food,
      price: price
    }
  end

  private
  attr_reader :menu
end
