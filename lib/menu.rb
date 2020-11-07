class Menu
  def initialize(items = [])
    @items = items
  end

  def display_all
    puts @items
  end

  def display_food
    @items.each { |item| puts item if item.class == Food }
    nil
  end

  def display_drinks
    @items.each { |item| puts item if item.class == Drink }
    nil
  end
end