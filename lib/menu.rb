require_relative 'menu_dish'
require_relative 'send_sms'

class Menu
  attr_reader :dishes, :order
  DISHES = [['Tagliatelle with duck ragu', 9], ['Pizza Diavola', 10], ['Salad Caprese', 8.5]]

  def initialize order
    @order = order
    @dishes = build_dish_instances
  end

  def show
    dishes.map(&:readable).join("\n")
  end

  def select dish_name, quantity
    order.select dish_name, quantity, dishes
  end

  private

  def build_dish_instances
    DISHES.map { | name_price | MenuDish.new name_price[0], name_price[1] }
  end
end
