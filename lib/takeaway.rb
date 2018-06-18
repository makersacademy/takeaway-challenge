# frozen_string_literal: true

require_relative 'menu'
require_relative 'messenger'

class Takeaway
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
    raise 'Must choose a number >0' unless amount.positive?
    chosen_item = hashed_order(item, amount)
    update_order(chosen_item)
    format("#{chosen_item[:item_name]} x#{chosen_item[:quantity]} = £%0.2f", item_subtotal(chosen_item))
  end

  def delete_item(item)
    order.delete_if { |hash| hash[:item_name] == item }
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
    @order = []
    'Order placed!'
  end

  private

  attr_reader :menu

  def build_order
    order.map do |item|
      format("#{item[:item_name]} x#{item[:quantity]} = £%0.2f", item_subtotal(item))
    end.join(', ')
  end

  def update_order(chosen_item)
    raise 'Item already in order, please remove it first' if item_in_order chosen_item
    order << chosen_item
  end

  def hashed_order(item, amount)
    item_hash = display_menu.find { |hash| hash[:item_name] == item }
    item_hash[:quantity] = amount
    item_hash
  end

  def on_menu?(name)
    display_menu.any? do |item|
      item.value? name
    end
  end

  def calculate_total
    @total_cost = order.reduce(0) { |sum, item| sum + item[:quantity] * item[:price].to_f }
    format('The grand total is £%0.2f', total_cost)
  end

  def item_subtotal(chosen_item)
    chosen_item[:price].to_f * chosen_item[:quantity]
  end

  def send_confirmation(message)
    @messenger.send(message)
  end

  def item_in_order(chosen_item)
    order.any? { |hash| hash[:item_name] == chosen_item[:item_name] }
  end
end
