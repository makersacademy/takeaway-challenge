require 'csv'

class Menu

  CSV_FILENAME = 'lib/menu.csv'


  def initialize
    @csv_file = File.absolute_path(CSV_FILENAME)
    @menu = load_csv
  end

  def load_csv
    restaurant_array = []
    CSV.foreach(csv_file) do |row|
      food, price = row
      restaurant_array << menu_entry_maker(food,price)
    end
    restaurant_array
  end

  def on_menu?(menu_item)
    menu_search = view.select {|item| item[:food] == menu_item}
    !menu_search.empty?
  end

  def view
    menu.dup
  end

  def order_cost(order)
    total = order.map {|item| get_price(item)}
    total.reduce(:+)
  end

  def get_price(food)
    menu = view
    menu.each do |entry|
      return entry[:price] if food == entry[:food]
    end
  end

  def menu_entry_maker(food,price)
    {
      food: food,
      price: price
    }
  end

  private
  attr_reader :menu, :csv_file
end
