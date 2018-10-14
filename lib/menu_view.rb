require_relative 'category_view'

class MenuView

  def initialize(menu, category_view_class = CategoryView)
    @menu = menu
    @category_view_class = category_view_class
  end

  def display
    @menu.categories.reduce("MENU\n") do |sum, category|
      sum + @category_view_class.new(category).display
    end
  end

end
