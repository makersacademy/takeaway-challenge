require './lib/menu.rb'
require './lib/sms_sender.rb'
require './lib/order.rb'

class Controller
  attr_reader :current_order, :current_menu

  DEFAULT_MENU_PATH = './menu.csv'

  def initialize
    @current_menu = Menu.new(DEFAULT_MENU_PATH)
    new_order
  end

  def fetch_sms_sender
    puts 'Enter SID:'
    sid = gets.chomp
    puts 'Enter Auth Token:'
    auth = gets.chomp
    SMSSender.new(sid, auth)
  end

  def new_order
    @current_order = Order.new
  end

  def select_menu(path)
    Menu.new(path)
  end

  def show_menu
    @current_menu.list_prices
  end

  def show_order
    @current_order.list
    @current_order.print_total
  end

  def add_to_order(number)
    chosen_item = @current_menu.select(number)
    @current_order.add(chosen_item)
  end

  def send_sms
    @sms_sender = fetch_sms_sender
    @sms_sender.send_message(@current_order.items, @current_order.print_total)
  end
end
