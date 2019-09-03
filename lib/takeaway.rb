# frozen_string_literal: true

require './lib/menu_item'

class Takeaway
  DEFAULT_DELIVERY_WINDOW = 60 * 60

  def initialize(menu_hash:, sms_class:, menu_class:, order_class:)
    @sms_sender = sms_class.new
    @order_class = order_class
    @menu = menu_class.new(menu_hash.map { |k, v| MenuItem.new(k, v) })
  end

  def menu
    @menu.dup
  end

  def order(item_indices)
    @order_class.new(@menu.items_at(item_indices), DEFAULT_DELIVERY_WINDOW)
  end

  def send_confirmation(order:)
    @sms_sender.send_sms(order.contact_number, order.to_string)
  end
end