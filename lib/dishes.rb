require 'csv'
require_relative 'dish'

class Dishes

  ERRORS = { no_dish: 'Dish not found',
  no_dishes: 'No dishes currently available' }

  def initialize(source = nil)
    @source = source
    @dishes = []
    read_from_csv unless @source.nil?
  end

  def describe
    raise ERRORS[:no_dishes] if no_dishes?
    "Menu:\n" + @dishes.map(&:describe).join("\n")
  end

  def get_dish id
    raise ERRORS[:no_dishes] if no_dishes?
    dish = @dishes.find { |d| d.id == id }
    raise ERRORS[:no_dish] unless dish
    dish
  end

  private
  def read_from_csv
    CSV.foreach(@source) { |row| @dishes << Dish.new(row[0], row[1].to_f) }
  end

  def no_dishes?
    @dishes.empty?
  end
end
