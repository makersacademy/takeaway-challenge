
# in lib/menu.rb
class Menu
  attr_reader :dishes

  INDEX_WIDTH = 1
  ITEM_WIDTH = 20
  PRICE_WIDTH = 5

  def initialize
    @dishes = [
      ["spam", 2.5],
      ["eggs and spam", 4.5],
      ["ham and spam", 4.5],
      ["spam and spam", 4],
      ["extra spam", 1]
    ]
  end

  def show_dishes
    @dishes.each_with_index do |item, index|
      puts format_line(index, item[0], item[1])
    end
  end

  def get_dish(index)
    @dishes[index]
  end

  private

  def format_line(index, dish, price)
    formatted_index = format_with_space(index.to_s, INDEX_WIDTH)
    formatted_dish = format_with_space(dish, ITEM_WIDTH)
    formatted_price = format_with_space(format_price(price), PRICE_WIDTH)
    "| #{formatted_index} | #{formatted_dish} #{formatted_price} |"
  end

  def format_price(amount)
    '£%.2f' % amount
  end

  def format_with_space(item, max_length)
    space = ' ' * (max_length - item.length).clamp(0, max_length)
    item + space
  end
end
