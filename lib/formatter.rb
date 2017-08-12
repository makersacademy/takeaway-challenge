
class Formatter

  INDEX_WIDTH = 1
  ITEM_WIDTH = 20
  PRICE_WIDTH = 5

  def self.format_line(index, dish, price)
    formatted_index = format_with_space(index.to_s, INDEX_WIDTH)
    formatted_dish = format_with_space(dish, ITEM_WIDTH)
    formatted_price = format_with_space(format_price(price), PRICE_WIDTH)
    "| #{formatted_index} | #{formatted_dish} #{formatted_price} |"
  end

  def self.format_price(amount)
    '£%.2f' % amount
  end

  def self.format_with_space(item, max_length)
    space = ' ' * (max_length - item.length).clamp(0, max_length)
    item + space
  end
end
