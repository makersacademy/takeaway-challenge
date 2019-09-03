require_relative 'menu'
class Order
  attr_reader :ordered_dishes, :price_total, :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @price_total = []
    @ordered_dishes = []
  end

  def select_dish(item, quantity = 1)
    fail "Dish not available" unless available?(item.to_sym)

    @ordered_dishes << "#{quantity} x #{item}"
    add_price(quantity.to_i, item.to_sym)

  end

  def total_price
    @price_total.map { |cost| cost.inject(:*) }.sum
  end

  def compare_price(user_estimate)
    raise "Recalculate the total of your order" if total_price != user_estimate
    print "You calculated right, the price is £#{total_price}"
  end

private

  def available?(item)
    @menu.dishes.has_key?(item)
  end

  def add_price(quantity, item)
    @price_total << [quantity, @menu.dishes[item]]

  end
end
