class Order
  attr_reader :basket

  def initialize(menu)
    @basket = Hash.new(0)
    @menu = menu
  end

  def add_items(item, quantity)
    raise('Invalid dish. Only items on the menu can be added to your order.') unless @menu.on_menu?(item)
    # Needs a raise error for when quantity is not an intiger
    @basket[item] += quantity
  end

  def order_summary
    # Needs refactoring
    # What happens if the order is empty?
    output = Array.new
    @basket.each { |dish, quantity|
      output << "#{dish} x#{quantity} = £#{@menu.menu_items[dish] * quantity}"
    }
    output.join(', ')
  end

  def total
    "£#{sum}"
  end

  def checkout(amount)
    # What happens if checking out without ordering anything?
    raise('Incorrect amount. You need to enter the correct order total to checkout.') unless correct_amount?(amount)
  end

  private
  def sum
    # Needs refactoring
    sum = 0
    @basket.each { |key, value|
      sum += @menu.menu_items[key] * value
    }
    sum
  end

  def correct_amount?(amount)
    amount == sum
  end

end
