
class Menu

  def initialize
    @menu_items = {
      :burger => 5,
      :pizza => 10,
      :fries => 2,
      :salad => 3
    }
  end

  def list_items
    p "Menu items"
    @menu_items.map { |key, value| [key.to_sym, value.to_i] }
  end
end
