require_relative 'menu'
require_relative 'digital_till'
require_relative 'messenger'

class Takeaway
  attr_reader :menu, :order

  def initialize(menu: menu_object, dgt_class: DigitalTill, messenger_class: Messenger)
    @menu = menu
    @order = []
    @digital_till_class = dgt_class
    @messenger_class = messenger_class
  end

  def make_order(items, total)
    save_order(items)
    fail "Total does not match items" unless correct_total?(total)
    @messenger_class.new.sms_confirmation
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

  def correct_total?(total)
    @digital_till_class.new(@order).verify_total(total)
  end

end
