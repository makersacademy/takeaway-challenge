require './lib/sms.rb'
require './lib/menu.rb'

class Order

  attr_reader :items, :messenger

  def initialize(items = [])
    @items = items
    @messenger = SMS.new
  end

  def assign_dishes(dishes)
    dishes.each { |dish|
      menu.each { |item| add(item) if item.name == dish }
    }
  end

  def order_quantity
    items.length
  end

  def quantity_correct?(expected_total)
    expected_total == order_quantity
  end

  def confirm_order
    messenger.send_text
  end

  private

  def menu
    menu = Menu.new
    menu.list
  end

  def add(dish)
    @items << dish
  end

end
