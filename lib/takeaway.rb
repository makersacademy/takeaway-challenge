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
      import_dishes_from(filename)
    else
      "File '#{filename}' not found!"
    end
  end

  private

  def import_dishes_from(filename)
    CSV.foreach(filename) { |line| add_dish(line) }
  end

  def add_dish(data)
    name, price = data
    @dishes << { name: name, price: price }
  end
end
