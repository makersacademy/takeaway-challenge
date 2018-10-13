class Order
  attr_reader :basket

  def initialize(menu)
    @basket = Hash.new(0)
    @menu = menu.menu_items
  end

  def add_items(item, quantity)
    # Needs a raise error for when dish is not on the menu
    # Needs a raise error for when quantity is not an intiger
    @basket[item] += quantity
  end

  def order_summary
    # Needs refactoring
    # What happens if the order is empty?
    output = Array.new
    @basket.each { |dish, quantity|
      output << "#{dish} x#{quantity} = £#{@menu[dish] * quantity}"
    }
    output.join(', ')
  end

  def total
    # Needs refactoring
    sum = 0
    @basket.each { |key, value|
      sum += @menu[key] * value
    }
    sum
  end

end
