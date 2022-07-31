require_relative 'dish'

class List

  attr_reader :dish_list, :checkout

  def initialize
    @dish_list = Hash.new
    @checkout = []
  end

  def add_dish(dish)
    @dish_list.store(dish, dish.price)
  end

  def print
    p @dish_list
  end

  def select(dish)
    @dish_list.select do |k, v|
      if k == dish
        insert = {k => v}
        @checkout << insert
      end
    end
  end

  def checkout
    puts @checkout.join
  end
end
