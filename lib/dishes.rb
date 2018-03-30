require 'csv'
require_relative 'dish'

class Dishes
  def initialize(source = nil)
    @source = source
    @dishes = []
    read_from_csv unless @source.nil?
  end

  def describe
    "Menu:\n" + @dishes.map(&:describe).join("\n")
  end

  private
  def read_from_csv
    CSV.foreach(@source) { |row| @dishes << Dish.new(row[0], row[1].to_f) }
  end
end
