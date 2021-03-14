class Menu

  attr_reader :menu, :name, :item

  def initialize(name = 'name')
    @name = name
    @menu = []
  end

  def add_item(name, price, description)
    item = Item.new(name, price, description)
    save_item(item)
  end

  def save_item(item)
    @menu << item
  end

  def change_item_name(index, name)
    @menu[index].change_name(name)
  end

  def change_item_price(index, price)
    @menu[index].change_price(price)
  end

  def change_item_description(index, description)
    @menu[index].change_description(description)
  end

  def delete_item(index)
    @menu.delete @menu[index]
    @menu
  end

  def print_menu
    @menu.map { |item| "#{item.name} -- £#{item.price}\n\n#{item.description}" }.join
  end

end
