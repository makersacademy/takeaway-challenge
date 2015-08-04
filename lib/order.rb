class Order

  attr_accessor :order_summary, :total_cost

  def initialize
    @order_summary = {}
    @total_cost = 0
  end

  def add restaurant, food_item, quantity=1
      raise "Invalid menu selection. Please try again." unless check_inclusion? restaurant, food_item # r.menu.items.keys.include? food_item
      order_summary[food_item] == nil ? order_summary[food_item] = quantity : order_summary[food_item] += quantity
      price = get_price restaurant, food_item
      quantity.times {self.total_cost += price } # Why was self needed here?? Kicked up error for '+' if not used...
  end

  def check_inclusion? restaurant, food_item
    restaurant.check_inclusion? food_item
  end

  def get_price restaurant, food_item
    restaurant.get_price food_item
  end

  def display_order restaurant
    headings = ["Dish", "Quantity", "Unit price"]
    rows = []
    rows = order_summary.map { |item, quantity| [item, quantity, get_price(restaurant, item)] }
    rows.push(["Order Total", order_summary.values.inject(:+), total_cost])
    table = Terminal::Table.new :headings => headings, :rows => rows
    puts table
  end

end
