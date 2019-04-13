
class Menu
  attr_reader :dishes
  
  def initialize(dishes)
    @dishes = dishes
  end

  def show_dish
    @dishes.map(&array_map).join(', ')
  end

  private 
  def array_map
    Proc.new { |value, key| '%s £%d' % [value, key] }
  end
end
