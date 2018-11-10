require 'pry'
require_relative 'dish'

class Restaurant

  def initialize(dishes = [])
    @dishes = dishes
  end

  def list_dishes
    @dishes
  end

  def dish(name)
    fail "No such dish!" unless find_dish(name)
    find_dish(name)
  end

  private

  def find_dish(name)
    @dishes.detect { |dish| dish.name == name }
  end
end
