

class Menu

  require 'CSV'
  
  attr_reader :dishes, :filepath

  def initialize(filepath)
    @filepath = filepath
    @dishes = []
  end

  def load_dishes
    CSV.foreach(@filepath) do |row|
      @dishes << create_dish(row[0],row[1].to_f)
    end
  end

  private

  def create_dish(name,price)
    Dish.new(name,price)
  end

end
