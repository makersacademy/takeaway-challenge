class Menu
  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def list_menu
    dishes.map { |key, value| "#{key} --- £#{value}" }.join(', ')
  end
end
