require 'bigdecimal'
require_relative 'delivery'

class Order
  def initialize(menu: menu_object, delivery_klass: Delivery)
    @details = []
    @menu = menu
    @total = 0
    @delivery = delivery_klass.new
  end

  def add(dish_name, quantity = 1)
    dish = find_dish(dish_name)
    save_order(dish, quantity)
  end

  def details
    @details.dup.freeze
  end

  def view
    summary = []
    details.each { |sub_order| summary << dish_details(sub_order) }
    summary.dup.freeze
  end

  def summary
    "Total: $#{total}"
  end

  def remove(dish_name)
    dish = find_dish(dish_name)
    @details.reject! do |sub_order|
      sub_order[:dish].name == dish.name
    end
  end

  def complete
    @delivery.dispatch(total)
    empty_details
  end

  def total
    total = 0
    view.each { |order| total += order[:sub_total] }
    format('%.2f', ((total * 100).round / 100.0))
  end

  private

  def find_dish(name)
    @menu.find_dish(name)
  end

  def save_order(dish, quantity)
    @details << { dish: dish, quantity: quantity }
  end

  def dish_details(sub_order)
    quantity = sub_order[:quantity]
    sub_total = sub_order[:dish].price * quantity
    { name: sub_order[:dish].name, sub_total: sub_total, quantity: quantity }
  end

  def empty_details
    @details = []
  end
end
