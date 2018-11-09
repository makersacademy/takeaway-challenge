
class Menu

  attr_reader :item

  def initialize
    @menu_items = {
      :burger => 5,
      :pizza => 10,
      :fries => 2,
      :salad => 3
    }
    @item = []
  end

  def list_items
    p "Menu items"
    @menu_items.map { |key, value| [key.to_sym, value.to_i] }
  end

  def order_items
    input = ""
    p "What would you like to order?"
    p "To finish ordering please type end"
    while input == gets.chomp
      @item << input
      break if input == "end"
    end
    p @item.reverse.drop(1)
  end
end
