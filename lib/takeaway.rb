require_relative "menu.rb"
require_relative "calculator.rb"

class Takeaway
  
  def initialize(menu: Menu.new)
    @menu = menu
    @order = {}
  end

  def add(item, quantity = 1)
    item = item.to_sym
    raise "Item not in menu, please check spelling" unless @menu.dishes.key?(item)
    iterate_through_order(item, quantity)
  end

  def show_menu
    @menu.dishes
  end

  def order
    @order
  end

  # would be better if shortened, any suggestions?
  def checkout(dishes = @menu.dishes)
    input = Calculator.current_basket(@order, dishes)
    output = []
    input.each do |item|
      output.push("#{item.values[0]} x#{item.values[1]} = £#{item.values[2]}")
    end
    output.join(", ")
  end

  def total
    Calculator.current_basket(@order, @menu.dishes)
    total = Calculator.total
    "Total: £#{total}"
  end

  private

  def iterate_through_order(item, quantity)
    @order.key?(item) ? iterate_and_update(item, quantity) : @order[item] = quantity
    @order
  end

  def iterate_and_update(item, quantity)
    @order.each do |key, value|
      @order[item] = value + quantity if item == key
    end
  end


end