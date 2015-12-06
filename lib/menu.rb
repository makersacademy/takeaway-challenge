require_relative 'item'

class Menu

  attr_reader :items

  def initialize
    @items = [
    Item.new('Satay', 4.50),
    Item.new('Spring rolls', 3.00),
    Item.new('Tom yum soup', 4.90)
    ]
  end

  def get_item(food)
    items.each { |item| return item if item.name == food }
    fail 'Sorry we don\'t have that on our menu'
  end

  def add(item)
    @items << item
  end

  def remove(item_name)
    @items.delete(get_item(item_name))
  end
end
