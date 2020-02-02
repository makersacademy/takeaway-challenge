require_relative "menu.rb"

class Takeaway
  
  def initialize(menu: Menu.new)
    @menu = menu
    @order = {}
  end

  def add(item, quantity = 1)
    item = item.to_sym
    raise "Item not in menu, please check spelling" unless @menu.dishes.key?(item)
    if @order.key?(item)
      @order.each do |key, value|
        @order[key] = value + quantity if key == item
      end
    else 
      @order[item] = quantity
    end
  end

  def show_menu
    @menu.dishes
  end

  def order
    @order
  end

end