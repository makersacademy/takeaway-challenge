require_relative 'formatter'

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

  def show_basket
    @items.each_with_index do |item, index|
      puts @formatter.format_line(index, item[:name], item[:price])
    end
  end
end
