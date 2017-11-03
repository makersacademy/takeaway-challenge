require_relative 'dish'
require 'csv'

class Menu

  attr_reader :menu

  CSV_PATH = File.open(File.dirname(__FILE__) + '/menu.csv')

  def initialize
    @menu = []
    load_dishes
  end

  def show
    @menu.each_with_index { |dish, index|
      print_dish(index + 1, dish) }
  end

  def send_dish(number)
    @menu[number - 1]
  end

  def send_dish_price(number)
    @menu[number - 1].price.to_i
  end

private

  def load_dishes
    CSV.foreach(CSV_PATH) {
      |line| add_dish(line[0], line[1]) }
  end

  def add_dish(description, price)
    @menu << Dish.new(description, price)
  end

  def print_dish(index, dish)
    puts "#{index}. #{dish.description} - £#{dish.price}"
  end

end
