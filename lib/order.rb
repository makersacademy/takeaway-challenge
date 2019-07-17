require 'menu'
require 'order'
require 'pry'
require 'dish'

class Order
  def initialize(dishes = [])
    @dishes = dishes
  end

  def total
    sum = 0
    @dishes.each { |dish, quantity| sum += (dish.price * quantity) }
    sum
  end

  def add(dish, number = 1)
    @dishes.push([dish, number])
  end

  def list_dishes
    @dishes
  end

  def total_quantity
    total = 0
    @dishes.each { |_item, quantity| total += quantity }
    total
  end

end

binding.pry
