class Order

  attr_reader :order

  def initialize(menu = Menu.new)
    @order = Hash.new(0)
    @menu = menu
  end

  def add_to_order(dish, quantity)
    raise "Sorry this dish is not available" unless available?(dish)
    @order[dish] += quantity
  end

  def total_cost
    total = 0
    @order.each do |dish, quantity|
      total += @menu.dishes[dish] * quantity
    end
    total
  end

  def subtotals
    @order.each do |dish, quantity|
      puts "#{quantity} x #{dish}: £#{'%.2f' % (@menu.dishes[dish] * quantity)}"
    end
  end

  private

  def available?(dish)
    @menu.dishes.has_key?(dish)
  end

end
