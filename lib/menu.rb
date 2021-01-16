class Menu

attr_reader :dishes, :printed_menu

  def initialize(dishes)
    @dishes = dishes
  end

  def print
    @printed_menu = []
    dishes.map do | key, value |
      printed_menu << "Dish: #{key} - £#{value}"
    end
    printed_menu
  end
end
