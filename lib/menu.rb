require_relative 'sample_menu'
require_relative 'item'

class Menu

  def initialize(item_class = Item)
    @menu = []
    @current_order = nil
    @sample_menu = [
      {name: "bread", price: 2},
      {name: "soup", price: 3},
      {name: "cheese", price: 1},
      {name: "spaghetti", price: 5},
      {name: "pizza", price: 4},
      {name: "lasagne", price: 6}
    ]
  end

  def start
    load_menu
    @current_order = @menu
  end

  def select(item_name, quantity)
    @current_order.each do |item|
      if item.name == item_name
        item.add_to_order(quantity)
      end
    end
  end

  def print_current_order
    order = ''
    @current_order.each do |item| 
      if item.quantity > 0
        order = order + "#{item.name}: #{item.quantity}, "
      end 
    end
    order = order.chop.chop + "."
    order
  end

  def print_menu
    menu = 'Menu: '
    @menu.each do |item| 
      menu = menu + item.name + ": " + "£%.2f" % item.price + ", "
    end
    menu = menu.chop.chop + "."
    menu
  end

  def order_price
    total = 0
    @current_order.each do |item|
      item.quantity.times do
        total += item.price
      end
    end
    total
  end

  private

  def load_menu
    @sample_menu.each do |item|
      name = item[:name]
      price = item[:price]
      @menu << Item.new(name, price)
    end
  end
end