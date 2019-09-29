require_relative 'menu'
require_relative 'digital_till'

class Takeaway
  attr_reader :menu, :order

  def initialize(menu: menu_object, dgt_class: DigitalTill)
    @menu = menu
    @order = []
    @digital_till_class = dgt_class
  end

  def make_order(items, total)
    save_order(items)
    @digital_till_class.new(@order).verify_total(total)
  end

  def view_menu
    @menu.view_items
  end

  def print_receipt
    print @digital_till_class.new(@order).itemised_receipt
  end

  private

  def save_order(items)
    items.split(',').each { |item| food, quantity = item.split
      @order << { quantity: quantity.to_i, item: food,
                cost: @menu.items[food.to_sym] * quantity.to_i }
    }
  end

end
