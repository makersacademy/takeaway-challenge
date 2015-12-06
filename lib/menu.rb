require_relative 'order'
require 'yaml'

class Menu

  MENU = YAML::load(File.open('./lib/resources/menu.yml'))

  def initialize(order = Order)
    @order_klass = order
    @order = @order_klass.new
  end

  def view
    output = "---- MENU -----\n"+readable_list
  end

  def select(dish_name, quantity = 1)
    dish = find(dish_name)
    dish = w_quantity(find(dish_name), quantity)
    @order.add(dish)
  end

  def order
    @order
  end

  private

  def readable_list
    string = ""
    MENU.each do |section, dishes|
      string += "<><> #{section.downcase} <><>\n"
      dishes.each { |dish| string += "#{dish[:name]} $#{dish[:price]}\n"}
    end
    string
  end

  def find(dish_name)
    MENU.each do |section, dishes|
      dishes.each do |dish|
        @dish_found = dish if dish[:name] == dish_name
      end
    end
    @dish_found ? @dish_found : fail("Not in the menu!")
  end

  def w_quantity(dish, quantity)
    dish.merge(quantity: quantity)
  end

end
