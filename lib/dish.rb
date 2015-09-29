require 'line_length'

class Dish
  include LineLength
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def display_info
    display_part_i + display_part_ii
  end

  private

  def display_part_i
    space_length = PART_I_LENGTH - name.length
    name + " "*space_length
  end

  def display_part_ii
    price = '%.2f' % @price
    space_length = PART_II_LENGTH - '£'.length - price.length
    "£" + " "*space_length + price
  end
end
