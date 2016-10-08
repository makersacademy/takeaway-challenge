require 'CSV'

class Menu

  attr_reader :dishes, :filepath

  def initialize(filepath)
    @filepath = filepath
    @dishes = []
    load_dishes
  end

  def load_dishes
    CSV.foreach(@filepath) do |row|
      @dishes << Dish.new(row[0],row[1].to_f)
    end
  end

end
