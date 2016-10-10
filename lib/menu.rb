require 'CSV'

class Menu

  attr_reader :dishes, :filepath, :menu_array

  def initialize(filepath)
    @filepath = filepath
    @dishes = []
    @menu_array = []
  end

  def load_dishes
    CSV.foreach(@filepath) do |row|
      @dishes << create_dish(row[0],row[1].to_f)
    end
  end

  def build_menu_display
    load_dishes
    menu_display
  end

  def menu_display
    @dishes.each_with_index do |dish, index|
      @menu_array << "#{index + 1}. #{dish.name.ljust(20)}  £#{'%.2f' % [dish.price]}"
    end
  end

  private

  def create_dish(name,price)
    Dish.new(name,price)
  end

end
