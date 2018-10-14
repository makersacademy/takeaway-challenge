require 'dish_view'

class CategoryView

  def initialize(category, dish_view_class = DishView)
    @category = category
    @dish_view_class = dish_view_class
  end

  def display
    @category.items.reduce("") do |sum, dish|
      sum + @dish_view_class.new(dish).display
    end
  end
end
