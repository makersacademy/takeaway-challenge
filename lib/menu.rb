require 'csv'
require './lib/menuitem'
require './lib/formats/menuformat'

# Menu is a collections of MenuItems.
class Menu
  attr_reader :items
  START = 100

  class << self
    def from_csv(path, menuitem_class = MenuItem, reader = CSV)
      new(reader.foreach(path).map { |row| menuitem_class.new(*row) })
    end
  end

  def initialize(items)
    @items = items
  end

  def get(index)
    @items[index - START]
  end

  def format(formatter = MenuFormat.new, *args)
    items.each_with_index.map do |item, index|
      formatter.format(index + START, item, *args)
    end.join('<br>')
  end

  def get_missing(items)
    items.keys.select { |key| get(key).nil? }
  end
end
