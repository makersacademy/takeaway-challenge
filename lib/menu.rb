require_relative 'item'

class Menu

  attr_reader :names, :items

  def initialize(names, item = Item)
    @names = names
    @items = create_items(item)
  end

  def create_items(item)
    @items = @names.map{ |name| item.new(name) }
  end

  # def list_items
  #   @items.each{ |item| item.name }
  # end
end
