
class Menu

attr_reader :dishes, :price

  def initialize(dishes)
    @dishes = dishes
  end

  def print
    printed_menu = []
    @dishes.each do | key, value |
    printed_menu << "#{key} - £#{value}"
    end
    printed_menu.join(", ")
  end

  def price(dish)
    @dishes[dish]
  end


end
