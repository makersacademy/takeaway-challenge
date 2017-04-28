
class Menu

  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def print_menu
    dishes.map do |item, price|
      "%s £%.2f" % [item.to_s.capitalize, price]
    end.join(', ')
  end

  def has_dish?(dish)
    !dishes[dish].nil?
  end
end
