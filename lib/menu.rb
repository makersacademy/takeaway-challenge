require './lib/dish.rb'

require 'csv'

class Menu

  attr_reader :list

  def initialize(list = [])
    @list = list; load_from_file
  end

  # ------------------- PUBLIC INTERFACE (visible to Takeaway) -------------------

  def see_dishes
    price_list.map { |item| "#{item.name} (£#{item.price})"}.join("; ")
  end

  # ------------------- PUBLIC INTERFACE (visible to Takeaway) -------------------

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

end
