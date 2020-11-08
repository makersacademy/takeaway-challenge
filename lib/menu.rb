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

  def add(item)
    @items.push(item)
  end

  def select(id)
    @items.each { |item| return item if item.id == id }

    raise "Item doesn't exist in the menu"
  end
end
