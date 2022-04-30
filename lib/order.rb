require_relative 'menu'

class Order

  attr_reader :current_order

  def initialize
    @current_order = []
  end

  def add_dish(id, quantity)
    dish = {:dish => @@menu.select_dish(id), :quantity => quantity}
    dish_already_added?(id) ? update_dish_quantity(id, quantity) : @current_order << dish
  end

  def remove_dish(id)
    fail 'Dish has not been added' unless dish_already_added?(id)
    index = @current_order.index { |current_dish| current_dish[:dish][:id] == id }
    @current_order.delete_at(index)
  end

  def update_dish_quantity(id, quantity)
    remove_dish(id) if quantity < 1
    @current_order.each { |current_dish| current_dish[:quantity] += quantity if current_dish[:dish][:id] == id }
  end

  def total
    @current_order.map { |current_dish| current_dish[:dish][:price] * current_dish[:quantity]}.reduce(:+)
  end


  private

  @@menu = Menu.new

  def dish_already_added?(id)
    (@current_order.select { |current_dish| current_dish[:dish][:id] == id }) != [] ? true : false
  end

end