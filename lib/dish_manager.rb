require 'dish'

class DishManager
  attr_accessor :available_dishes

  def initialize(dishes_store_file_name)
    @available_dishes = []

    load_dishes(dishes_store_file_name)
  end

  def find_dish_by_name(name)
    @available_dishes.select { |dish| dish.name == name }.first
  end

  private

  def load_dishes(filename)
    return if File.zero? filename

    File.foreach(filename) do |line|
      data = line.split(', ')
      @available_dishes << Dish.new(data.first, data.last.chomp.to_f)
    end
  end
end