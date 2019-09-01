require './lib/takeaway'
require './lib/sms_sender'
require './lib/menu'
require './lib/order'

class Main
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

  def initialize
    @takeaway = Takeaway.new(menu_hash: DEFAULT_MENU,
                             sms_class: SMSSender,
                             menu_class: Menu,
                             order_class: Order)
  end

  def run
    print_greeting
    print_menu
    order = take_user_order
    return if request_confirmation == 'n'
    request_sms_number(order)
    send_sms(order)
  end

  private

  def print_greeting
    print_line_break
    puts "Please select your desired items by inputting their numbers, separated by commas. Hit enter when you're done."
    print_line_break
  end

  def print_menu
    puts "Menu:\n"
    puts @takeaway.menu.menu_items_string
    print_line_break
  end

  def take_user_order
    user_selection = gets.chomp.tr(' ', '').split(',')
    order = @takeaway.order(user_selection.map(&:to_i))

    print_line_break
    puts 'You ordered:', order.to_string
    print_line_break
    order
  end

  def request_confirmation
    puts 'Enter Y to place order, or N to exit'
    gets.chomp.downcase
  end

  def request_sms_number(order)
    puts 'Please enter a valid mobile number to receive an SMS confirmation'
    order.contact_number = gets.chomp
    print_line_break
  end

  def send_sms(order)
    @takeaway.send_confirmation(order: order)
    print_sms_confirmation(recipient)
  end

  def print_sms_confirmation(number)
    puts "You should receive an SMS confirmation to #{number} in the coming minutes"
  end

  def print_line_break
    puts ''
  end
end

