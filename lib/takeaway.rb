require "csv"

class Takeaway

  def initialize
    @dishes = []
  end

  def dishes
    @dishes.dup
  end

  def load_dishes(filename)
    if File.exist?(filename)
      CSV.foreach(filename) { |line| puts(line.inspect) }
    else
      "File '#{filename}' not found!"
    end
  end

  def add_dish(dish_data)
    name, price = dish_data
    @dishes << { name: name, price: price }
  end
end
