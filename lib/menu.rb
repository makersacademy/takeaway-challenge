require_relative 'item'
require_relative 'formatter'

class Menu

  attr_reader :names, :items

  def initialize(names, item = Item, formatter = Formatter)
    @names = names
    @items = create_items(item)
    @formatter = formatter.new
  end

  def print_menu
    @formatter.format_items(@items)
  end

  private

  def create_items(item)
    @items = @names.map { |name| item.new(name) }
  end

end
