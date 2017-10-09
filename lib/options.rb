require 'menu'
require 'order'
require 'send_sms'

class Options
  def initialize
    @order = Order.new
    @menu = Menu.new
    parse_menu_items
  end

  def request_menu_selection
    loop do
      puts 'Please make a menu selection'
      selection = gets.chomp
      process_selection(selection.upcase)
    end
  end

private

  def process_selection(menu_selection)
    case menu_selection
    when 'M' then  @menu.show
    when 'O' then  @order.show
    when 'Q' then  exit_program
    when 'T' then  send_sms
    when 'X' then  clear_order
    else
      raise 'Invalid selection: please check and try again' unless valid_selection(menu_selection)
      add_food_item(@menu_items[menu_selection])
    end
  end

  def exit_program
    puts 'Quit - are you sure? (Y/N)'
    exit if gets.chomp.casecmp('Y').zero?
  end

  def add_food_item(food_item)
    @order.confirm_item_quantity(food_item[:description], food_item[:unit_price])
  end

  def clear_order
    puts 'Clear order - are you sure? (Y/N)'
    @order = Order.new if gets.chomp.casecmp('Y').zero?
  end

  def send_sms
    raise 'Nothing to order' if @order.value.zero?
    SendSMS.new(@order.show)
  end

  def parse_menu_items
    @menu_items = {}
    Menu::MENU_ITEMS.split("\n") do |item|
      item_split = item.split("\t")
      item_hash = { description: item_split[1], unit_price: item_split[2] }
      @menu_items[item_split[0]] = item_hash
    end
  end

  def valid_selection(selection)
    @menu_items.keys.include?(selection)
  end
end
