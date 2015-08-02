require_relative 'twilio_sender'

class Takeaway

  attr_reader :selection, :menu

  def initialize
    @menu = {
      pizza: 9.99,
      chicken: 2.99,
      kebab: 4.99,
      beer: 0.99,
      cider: 0.99,
      wine: 7.99
      }
      @selection = {}
  end

  def display_menu
    @menu.each do |item, price|
      "#{item.to_s.capitalize} : £#{price}"
    end
  end

  def select_items item, quantity #selection_has_been_chosen?
    if item_has_already_been_chosen? item
      update_existing_quantity quantity, item
    else
      @selection[item] = quantity
    end
  end

  def total
    total_price = 0.0
    selection.each { |item, quantity| get_price item
      total_price += (@price * quantity) }
    price = total_price
  end

  def order phone_number
  end

  private

  attr_reader :menu

  def get_price item
    menu.select do |product, price|
      @price = menu[item]
    end
    @price
  end

  def item_has_already_been_chosen? item
    selection.has_key? item
  end

  def update_existing_quantity quantity, item
    existing_quantity = selection[item]
    selection[item] = quantity + existing_quantity
  end

  def time_in_one_hour
  end

  def order_message
  end
#it has a menu y
#it can show a menu y
#it can choose from the menu y
#it can choose more than one item off the menu y
#it can choose different quantitites of items from the menu y
#it can calculate the price of the menu (With one or multiple items) y
#it can then send a text with the price and time for delivery


end
