class Menu
  attr_accessor :items
  def initialize(items, dish_class = Dish)
    raise "please pass Menu an array to create a menu" unless items.is_a?(Array)
    raise "You can only create a menu with dishes" unless items.each { |item| item.is_a?(dish_class)}
    @items = items
  end
end