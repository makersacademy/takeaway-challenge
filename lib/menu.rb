# Understands storing and listing a menu
class Menu
  attr_reader :title, :items

  def initialize(title = 'Restaurant Menu')
    @title = title
    @items = {}
  end

  def add_item(item, price)
    items[item] = price.to_f
  end

  def list_items
    raise 'Please add an item to the menu first!' if items.empty?
    print_title
    print_items_with_prices
  end

  private

  def print_title
    print_seperator
    puts title
    print_seperator
  end

  def print_items_with_prices
    index = 1
    items.each do |item, cost|
      puts "#{index}. #{item} - £#{('%.2f' % cost)}"
      index += 1
    end
  end

  def print_seperator
    puts "-" * 30
  end
end
