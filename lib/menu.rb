require_relative 'dish'

class Menu

  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def print_menu
    dishes.map do |name, price|
      "%s £%.2f" % [name.to_s.capitalize, price]
    end.join(", ") 
  end

  # def order(selection)
  #   order = dishes.select { |dish| dish.name == selection }.first
  #   message = "Item not on the menu. Would you like to select a different dish?"
  #   fail message if order.nil?
  #   order
  # end
end
