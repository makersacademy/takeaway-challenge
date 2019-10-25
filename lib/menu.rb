require_relative 'item'

class Menu

  def initialize(item_class = Item)
    @menu = []
    @item_class = item_class
    @sample_menu = [
      { name: "bread", price: 2 },
      { name: "soup", price: 3 },
      { name: "cheese", price: 1 },
      { name: "spaghetti", price: 5 },
      { name: "pizza", price: 4 },
      { name: "lasagne", price: 6 }
    ]
  end

  def start
    load_menu
    'ready for your order'
  end

  def select(item_name, quantity)
    @menu.each do |item|
      if item.name == item_name
        item.add_to_order(quantity)
        return "#{item.quantity} #{item.name} added to order"
      end
    end  
  end

  def print_current_order
    order = ''
    @menu.each do |item| 
      if item.quantity.positive?
        order += "#{item.name}: #{item.quantity}, "
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
    @menu.each do |item|
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
      @menu << @item_class.new(name, price)
    end
  end
end
