require_relative 'menu'

class Order

  attr_reader :basket

  def initialize
    @basket = Hash.new(0)
  end

  def add(dish, quantity)
    dish_quantity_check(quantity)
    @menu = Menu.new
    dish_in_menu?(dish)
    @basket[dish] += quantity
  end

  def remove(dish, quantity)
    dish_removal_checks(dish, quantity)
    dish_quantity_check(quantity)
    @basket[dish] = @basket[dish] - quantity if @basket.has_key?(dish)
    dish_quantity_nil?(dish)
  end

  def sub_total
    order_empty?
    @basket.map do |dish, quantity|
      "#{dish} x#{quantity} = £#{"%.2f" % (quantity * @menu.dishes[dish])}"
    end.join(", ")
  end

  def total
    order_empty?
    order_total = 0
    @basket.each do |dish, quantity|
      order_total += (quantity * @menu.dishes[dish])
    end
    "Total cost: £#{'%.2f' % order_total}"
  end

  private

  def dish_in_menu?(dish)
    fail "This dish is not on the menu" unless @menu.dishes.has_key?(dish)
  end

  def dish_removal_checks(dish, quantity)
    fail "This dish is not in your order" unless @basket.include?(dish)
    fail "Please enter the correct number of dishes" if quantity > basket[dish]
  end

  def dish_quantity_nil?(dish)
    @basket.delete(dish) if basket[dish].zero?
  end

  def dish_quantity_check(quantity)
    fail "Please enter the correct number of dishes" if quantity <= 0
  end

  def order_empty?
    error = "You haven't added any dishes to your order. Please add dishes"
    fail error if @basket.empty?
  end

end
