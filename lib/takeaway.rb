require_relative 'menu'
require_relative 'messenger'

class TakeAway
  attr_reader :order, :total_cost

  def initialize(menu_class = Menu.new, messenger_class = Messenger.new)
    @menu = menu_class
    @messenger = messenger_class
    @order = []
    @total_cost = 0
  end

  def display_menu
    menu.show
  end

  def choose_item(item, amount = 1)
    raise 'Cannot choose this item!' unless on_menu? item
    raise 'Must choose a number >0' unless amount > 0
    chosen_item = hashed_order(item, amount)
    order << chosen_item
    "#{chosen_item[:item_name]} x#{chosen_item[:quantity]} = £%0.2f" % item_subtotal(chosen_item)
  end

  def view_order
    raise 'Please select an item first' if order.empty?
    build_order
  end

  def view_total
    calculate_total
  end

  def place_order
    message = "Thank you for your order. #{calculate_total} and will be with you within the hour!"
    send_confirmation(message)
  end

  private

  attr_reader :menu

  def build_order
    order.map do |item|
      "#{item[:item_name]} x#{item[:quantity]} = £%0.2f" % item_subtotal(item)
    end.join(', ')
  end

  def hashed_order(item, amount)
    item_hash = display_menu.find { |hash| hash[:item_name] == item }
    item_hash[:quantity] = amount
    item_hash
  end

  def on_menu?(name)
    display_menu.any? do |item|
      item.has_value? name
    end
  end

  def calculate_total
    @total_cost = order.reduce(0) { |sum, item| sum + item[:quantity] * item[:price].to_f }
    "The grand total is £%0.2f" % total_cost
  end

  def item_subtotal(chosen_item)
    chosen_item[:price].to_f * chosen_item[:quantity]
  end

  def send_confirmation(message)
    @messenger.send(message)
  end
end
