require_relative 'formatter'

DISPLAY_WIDTH = 50

class Basket
  attr_reader :items

  def initialize(formatter)
    @formatter = formatter
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def remove_item(index)
    @items.delete_at(index)
  end

  def basket_total
    value = 0
    @items.each { |item| value += item[:price] }
    value
  end

  def formatted_total
    @formatter.format_price(basket_total)
  end

  def show_basket
    @formatter.show_table("basket", @items)
    show_total
  end

  private

  def show_total
    "Total: #{basket_total}"
  end
end
