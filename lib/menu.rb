class Menu
  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def print_menu
    @dishes.map do |dish, price|
      "#{dish.capitalize}: £#{price}"
    end.join(", ")
  end


end






# class Menu
# attr_reader :dishes
#
#   MENU = {
#     :sashimi => 5,
#     :tempura => 4,
#     :uni => 4
#   }
#
#   def initialize
#     @dishes = MENU
#   end
#
#   def menu_list
#       @dishes.each { |item, price| "#{item}: £#{price}, " }
#   end
#
# end
