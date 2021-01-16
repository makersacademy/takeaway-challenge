require 'csv'
require_relative '../lib/dish.rb'

def csv_tool(data)
  CSV.open('support/menu.csv', 'wb') do |csv|

    data.each do |column|
      csv << column
    end

  end
end

menu_data = [
  [Dish.new('Chicken chow mein', 5)],
  [Dish.new('Singapore noodles', 5)],
  [Dish.new('Stir fried rice', 5)],
  [Dish.new('Prawn crackers', 2)],
  [Dish.new('Plain rice', 2)]
]

csv_tool(menu_data)
