require_relative 'menu'

class Order

  attr_reader :trolley, :menu

  def initialize
    @menu = Menu.new
    @trolley = []
  end

  def place_order(number)
    choice = menu.pizzas.values[number - 1]
    @trolley << choice
  end

  def view_order
    puts "Your Order:"
    @trolley.each_with_index { |choices, i| choices.each { |dish, price| puts "#{i+1}. #{dish}, #{price}" } }
    puts "Total: $#{total_price}"
  end

  def total_price
    prices = []
    @trolley.each { |choices| choices.each { |dish, price| prices << price[1..-1].to_i } }
    prices.reduce(:+)
  end

end
