require 'csv'

class Menu

  CSV_FILENAME = 'lib/menu.csv'


  def initialize
    @menu = load_csv
    @csv_file = File.absolute_path(CSV_FILENAME)
  end

  def load_csv
    restaurant_array = []
    CSV.foreach(f) do |row|
      food, price = row
      restaurant_array << menu_entry_maker(food,price)
    end
    restaurant_array

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
  attr_reader :menu :file
end
