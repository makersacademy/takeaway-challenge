class Takeaway
  attr_reader :order

  def initialize(menu = Menu.new)
    @menu = menu
    @order = {}
    @total = 0
  end

  def display_menu
    @menu.print
  end

  def add(item, quantity)
    raise "Item not on menu" unless @menu.dishes.include?(item)
    @order[item] = quantity
  end

  def total
    order.each do |item, quantity|
      @total += @menu.dishes[item] * quantity
    end
    @total
  end

end
