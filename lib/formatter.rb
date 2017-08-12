
class Formatter

  INDEX_WIDTH = 2
  ITEM_WIDTH = 20
  PRICE_WIDTH = 5

  def format_table(title, array)
    string = "#{head(title)}\n#{titles}\n"
    array.each_with_index do |item, index|
      string += line(index, item[:name], item[:price])
      string += "\n"
    end
    string
  end

  def format_price(amount)
    '£%.2f' % amount
  end

  private

  def head(title)
    star_row + "\n#{title.upcase}\n" + star_row
  end

  def titles
    formatted_index = space('id', INDEX_WIDTH)
    formatted_dish = space('dish', ITEM_WIDTH)
    "| #{formatted_index} | #{formatted_dish} price"
  end

  def line(index, dish, price)
    formatted_index = space(index.to_s, INDEX_WIDTH)
    formatted_dish = space(dish, ITEM_WIDTH)
    formatted_price = space(format_price(price), PRICE_WIDTH)
    "| #{formatted_index} | #{formatted_dish} #{formatted_price}"
  end

  def space(item, max_length)
    space = ' ' * (max_length - item.length).clamp(0, max_length)
    item + space
  end

  def star_row
    '*' * DISPLAY_WIDTH
  end
end
