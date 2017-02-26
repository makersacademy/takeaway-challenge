require_relative 'menu'
require_relative 'confirmation'


class MakeOrder

  attr_reader :menu, :order, :order_cost, :quantity, :pizza, :confirmation

  def initialize
    @menu = Menu.new
    @order = []
    @order_cost = []
    @quantity = []
  end

  def total_cost
    individual_cost = @order_cost.inject(:+)
    total_cost = individual_cost.size.times.collect {|i| individual_cost[i] * @quantity[i] }
    total_cost.inject(0, :+)
  end

  def order_food
    making_orders

    while (@pizza != '')
      add_to_order
      making_orders
    end

    @confirmation = Confirmation.new(order=@order,cost=total_cost)
  end

  private
  # add if statement to only add stuff if on menu
  # maybe add option to view current order so far
  def making_orders
    puts 'What would you like to order?'
    @pizza = STDIN.gets.chomp.capitalize

    if (@pizza != '')
      puts "How many would you like?"
      @pizza_quantity = STDIN.gets.chomp.to_i
    end
  end

  def add_to_order
    @order << @pizza
    @order_cost << @menu.pizza_menu.values_at(@pizza)
    @quantity << @pizza_quantity
  end
end
