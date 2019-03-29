require_relative "./dish.rb"
require_relative "./menu.rb"

class Order
  attr_reader :dishes

  def initialize(menu)
    @menu = menu
    @dishes = []
  end

  def add_to_order(id, quantity = 1)
    @dishes << { dish: @menu.get_by_id(id), quantity: quantity }
  end

  def remove_from_order(id, quantity = 1)
    @dishes.each { |item| item[:quantity] -= quantity if item[:dish] == @menu.get_by_id(id) }
    clean_order
  end

  def check_order
    @dishes.each { |item| item[:dish].print_dish}
  end

  def place_order

  end

  private

  def clean_order
    @dishes.delete_if { |item| item[:quantity] <= 0 }
  end
end
