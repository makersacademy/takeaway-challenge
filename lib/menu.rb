require './lib/food_list.rb'

class Menu
  include FoodList

  def get_item(item_name)
    items.find{|item| item.name == item_name}
  end
end
