require_relative 'menu'

class Order
  attr_reader :basket, :menu

  def initialize(menu = Menu.new)
    @basket = []
    @menu = menu
  end

  def add(item)
    add_to_basket(item)
  end

  private
  def add_to_basket(item)
    to_add = search_menu(item)
    basket.push(to_add)
    "#{to_add.keys.first} (#{to_add.values.first}) has been added to your basket."
  end

  def search_menu(item)
    raise "#{item} not found" unless menu.contents.has_key? item
    menu.contents.select { |k,v| k == item }
  end
end
