require 'set'

class Order
  attr_reader :order

  def initialize(order, total_price = 0)
    @order = order
    @total_price = total_price
  end

  def valid(menu_dishes)
    fail 'Empty order' if order_empty?

    fail 'Dish not in menu' if dish_not_available?(menu_dishes)
    
    fail 'Price does not match' if price_mismatch?(menu_dishes)

  end

  private

  def order_empty?
    @order.empty?
  end

  def dish_not_available?(menu_dishes)
    menu_dish_names = Set[]
    menu_dishes.each { |dish| menu_dish_names.add(dish.name) }

    @order.each { |dish| return !menu_dish_names.include?(dish[:name]) }
  end

  def price_mismatch?(menu_dishes)
    price_by_name = {}
    menu_dishes.each { |dish| price_by_name[dish.name] = dish.price }

    sum = 0
    @order.each do |dish|
      name = dish[:name]
      sum += price_by_name[name] * dish[:quantity]
    end
    @total_price != sum
  end
end
