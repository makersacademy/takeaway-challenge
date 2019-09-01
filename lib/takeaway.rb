# frozen_string_literal: true

class Takeaway
  DEFAULT_MENU = {
    'Cafe Latte'            => '4.75',
    'Flat White'            => '4.75',
    'Cappuccino'            => '3.85',
    'Single Espresso'       => '2.05',
    'Double Espresso'       => '3.75',
    'Americano'             => '3.75',
    'Cortado'               => '4.55',
    'Tea'                   => '3.65',
    'Choc Mudcake'          => '6.40',
    'Choc Mousse'           => '8.20',
    'Affogato'              => '14.80',
    'Tiramisu'              => '11.40',
    'Blueberry Muffin'      => '4.05',
    'Chocolate Chip Muffin' => '4.05',
    'Muffin Of The Day'     => '4.55'
  }.freeze

  DEFAULT_DELIVERY_WINDOW = 60 * 60

  def initialize(sms_class = SMSSender, menu_class = Menu, menu_hash = DEFAULT_MENU)
    @sms_sender = sms_class.new
    @menu = menu_class.new(menu_hash.map { |k, v| MenuItem.new(k, v) })
  end

  def menu
    @menu.dup
  end

  def order(item_indices)
    Order.new(@menu.items_at(item_indices), DEFAULT_DELIVERY_WINDOW)
  end

  def send_sms_confirmation(to:, body:)
    @sms_sender.send_sms(to, body)
  end
end