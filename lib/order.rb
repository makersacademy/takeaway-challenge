require_relative 'menu'
class Order
  attr_accessor :total_cost
  attr_reader :menu, :ticket
  def initialize(menu = Menu.new)
    @ticket = []
    @total_cost = 0
    @menu = menu
  end

  def select_dishes(dish,price, quantity)
    quantity.times do add_to_ticket(dish, price)
    end
  end

  def add_to_ticket(dish, price)
    selection = {dish => price}
    @ticket << selection
    sum_order
  end

  def sum_order
    prices = @ticket.map {|dish| dish.values}.flatten
    @total_cost = prices.inject(:+)
  end

  def delete_order
    @ticket = []
    @total_cost = 0
  end
end
