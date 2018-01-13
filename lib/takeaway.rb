class TakeAway
  attr_reader :order, :total_cost

  def initialize(menu_class:)
    @menu = menu_class
    @order = []
    @total_cost = 0
  end

  def display_menu
    menu.show
  end

  def choose_item(item, quantity)
    raise 'Cannot choose this item!' unless on_menu? item
    order << { 'item' => item, 'quantity' => quantity, 'price' => get_price(item) }
  end

  def view_order
    raise 'Please select an item first' if order.empty?
    order.each do |item|
      puts "#{item['item']}: #{item['quantity']} @ £%0.2f" % item['price']
    end
    update_total
  end

  private

  attr_reader :menu

  def on_menu?(item)
    menu.items.include? item
  end

  def get_price(item)
    menu.items[item]
  end

  def update_total
    @total_cost = 1.5
  end
end
