require 'csv'
require_relative './dish.rb'

class DishesList
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def load_menu(filename = "dishes_file.csv")
    # open the file
    if File.exists?(filename)
      dishes_file = CSV.read(filename)
      identifier = 1
      dishes_file.each do |line|
        name, qty, price = line
        add_item(identifier_count,
          Dish.new(identifier, description, qty.to_i, price))
        identifier += 1
      end
      file.close
    else
      raise "#{filename} doesn't exist."
    end
  end
end
