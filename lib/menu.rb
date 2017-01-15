require './lib/dish.rb'
require './lib/order.rb'

require 'csv'

class Menu

  attr_reader :list

  def initialize
    @list = []; load_from_file
  end

  def see_dishes
    price_list.map { |item| "#{item.name} (£#{item.price})"}.join("; ")
  end

  def select_dishes(*dishes, total)
    basket = Order.new
    assign_dishes(dishes, basket)
    fail error_message(total, basket) if !dishes_correct?(total, basket)
    basket.place_order
    return basket
  end

  private

  def load_from_file(filename = './data/menu_list.csv')
    CSV.foreach(filename) do |row|
      name = row[0]
      price = row[1]
      @list.push(Dish.new(name, price.to_f))
    end
  end

  def price_list
    @list.dup
  end

  def assign_dishes(dishes, order)
    dishes.each { |dish|
      list.each { |item| order.add(item) if item.name == dish }
    }
  end

  def dishes_correct?(total, order)
    total == order.check
  end

  def error_message(total, basket)
    "You've entered #{basket.check} dishes rather than the #{total} that you expected!"
  end

end
