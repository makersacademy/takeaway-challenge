require_relative "menu.rb"

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

  private

  def iterate_through_order(item, quantity)
    @order.key?(item) ? iterate_and_update(item, quantity) : @order[item] = quantity
  end

  def iterate_and_update(item, quantity)
    @order.each do |key, value|
      @order[key] = value + quantity
    end
  end


end