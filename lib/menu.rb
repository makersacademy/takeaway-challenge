
class Menu
attr_reader :list
  def initialize
    @list = [{menu_item: "Pizza", price: "8.00"}, {menu_item: "Nachos", price: "5.00"}, {menu_item: "Beer", price: "3.00"}]
  end
end
