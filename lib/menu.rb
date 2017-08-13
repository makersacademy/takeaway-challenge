
# in lib/menu.rb
class Menu
  attr_reader :dishes

  def initialize(formatter)
    @formatter = formatter
    @dishes = [
      { name: "spam", price: 2.5 },
      { name: "eggs and spam", price: 4.5 },
      { name: "ham and spam", price: 4.5 },
      { name: "spam and spam", price: 4 },
      { name: "extra spam", price: 1 }
    ]
  end

  def show
    @formatter.format_table("menu", @dishes)
  end

  def get_dish(index)
    @dishes[index]
  end

  def item_count
    @dishes.length
  end
end
