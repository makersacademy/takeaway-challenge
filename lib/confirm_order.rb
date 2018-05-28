require_relative 'menu'
require_relative 'sms_sender'
require 'pry'

class ConfirmOrder

  attr_reader :expected_total

  def initialize(menu, sms_sender = SMSSender.new)
    @sms_sender = sms_sender
    @menu = menu.menu_list
  end

  def process_order(requested_order, expected_total)
    @requested_order = requested_order
    @expected_total = expected_total
    raise 'Order not valid' unless ordered_items_on_menu?
    raise 'Incorrect total' unless expected_total_matches_calculated_total?
    send_sms(@expected_total)
  end


private

  def ordered_items_on_menu?
    list_of_menu_items = @menu.keys
    list_of_requested_items = @requested_order.keys
    (list_of_requested_items - list_of_menu_items).length == 0 ? true : false
  end

  def expected_total_matches_calculated_total?
    @actual_total = @menu.map { |item, price|
        price * @requested_order[item] if @requested_order.key?(item)
      }.compact.sum.round(2)
      @expected_total == @actual_total ? true : false
  end

  def send_sms(total)
    @sms_sender.send_sms(total)
  end
end
