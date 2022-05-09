#this is a work in progress to set up the menu for the resterant.


require 'csv'
require_relative 'dish.rb'
@menu_data = [
  ['Chicken chow mein', 5],
  ['Singapore noodles', 5],
  ['Stir fried rice', 5],
  ['Prawn crackers', 2],
  ['Plain rice', 2]
]

module Menu
  def add_dishes(data)
    CSV.open('./support/menu.csv', 'wb') { |csv| data.each { |column| csv << column } }
  end

  def build_menu(menu_path)
    @menu = Array.new
    @dishes = File.read(menu_path).split(/\r\n/).map{ |line| line.split(',')}
    @dishes.each { |dish, value|
      puts @menu.push(Dish.new(dish, value)) }
  end
end
