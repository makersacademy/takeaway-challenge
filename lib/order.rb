require './lib/sms.rb'
require './lib/menu.rb'

class Order

  attr_reader :items, :messenger

  def initialize(items = [])
    @items = items
    @messenger = SMS.new
  end

  # ------------------- PUBLIC INTERFACE (visible to Takeaway) -------------------

  def assign_dishes(dishes)
    dishes.each { |dish|
      menu.each { |item| add(item) if item.name == dish }
    }
  end

  def check_quantity(expected_total)
    fail error_message(expected_total) if !quantity_correct?(expected_total)
  end

  def see_order
    order_contents.map { |item| "#{item.name} (£#{item.price})"}.join("; ")
  end

  def confirm_order
    messenger.send_text
  end

  # ------------------- PUBLIC INTERFACE (visible to Takeaway) -------------------

  private

  def menu
    menu = Menu.new
    menu.list
  end

  def add(dish)
    @items << dish
  end

  def quantity_correct?(expected_total)
    items.length == expected_total
  end

  def error_message(expected_total)
    "You've entered #{items.length} dishes rather than the #{expected_total} that you expected!"
  end

  def order_contents
    @items.dup
  end

end
