class Takeaway

  attr_reader :dishes, :order

  def initialize(dishes = { "Pepperoni" => 7.50, "Hawaiian" => 6.50, "vegetarian" => 5.50 })
    @dishes = dishes
    @order = {}
  end

  def view_menu
    dishes
  end


  def add_to_order(dish, quantity)
    fail "#{dish} is not on the menu" unless dishes.has_key?(dish)
    order[dish] = quantity
  end


  def total
    order_totals.sum
  end






  private

  def order_totals
    order.map do |dish, quantity|
      dishes[dish] * quantity
    end
  end






end
