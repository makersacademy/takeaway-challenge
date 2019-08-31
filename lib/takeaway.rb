require './lib/currency_math'
require './lib/order'
require './lib/menu_item'

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
  }

  def initialize(sms_sender = SMSSender.new, menu_hash = DEFAULT_MENU)
    @sms_sender = sms_sender
    @menu = Menu.new(menu_hash.map { |k, v| MenuItem.new(k, v) })
  end

  def menu
    @menu.dup
  end

  def order(item_indicies)
    Order.new(retrieve_menu_items(item_indicies))
  end

  def send_sms_confirmation(to:, body:)
    @sms_sender.send(to, body)
  end

  private

  def retrieve_menu_items(item_indices)
    item_indices.reduce([]) { |items, i| items << @menu.items[i] }
  end
end