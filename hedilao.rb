require './lib/user'

$user = User.new(ENV['USER_MOBILE'])
$menu = Menu.new

# ------------------------------------------------------
# Main procedures
# ------------------------------------------------------
def interactive_menu
  loop do
    # print the menu and ask the user what to do
    print_menu
    # do what the user has asked
    process(gets.chomp)
    # let user choose to proceed to next
    puts "Press enter key to return to menu"
    gets.chomp
  end
end

# ------------------------------------------------------
# Menu
# ------------------------------------------------------
def print_menu
  print_banner

  divider_len = GlobalConstants::DIVIDER_LEN
  border_div = GlobalConstants::BORDER_DIV
  section_div = GlobalConstants::SECTION_DIV

  display_menu = border_div * divider_len
  display_menu += "\n" + section_div * divider_len + "\n" + "Menu" + "\n" + section_div * divider_len
  operation_menu.each { |item| display_menu += "\n" + "#{item["id"]}. #{item["name"]}" }
  display_menu += "\n" + border_div * divider_len + "\n" + "select a number listed below to operate"

  puts display_menu
end

def print_banner
  banner = File.read("docs/banner.txt")
  puts banner
end

def process(selection)
  menu_method(selection)
end

def operation_menu
  [ { "id" => "1", "name" => "View Menu", "method name" => :view_menu },
  { "id" => "2", "name" => "View Basket", "method name" => :view_basket },
  { "id" => "3", "name" => "Add to Basket", "method name" => :add_to_basket },
  { "id" => "4", "name" => "Delete from Basket", "method name" => :delete_from_basket },
  { "id" => "5", "name" => "Check Out", "method name" => :check_out },
  { "id" => "6", "name" => "Exit", "method name" => :exit_app } ]
end

def menu_method(id)
  method_name = nil
  operation_menu.each { |item| method_name = item["method name"] if item["id"] == id }
  method_name.nil? ? invalid_selection : method(method_name).call
end

def invalid_selection
  puts "Invalid selection, try again"
end

# ------------------------------------------------------
# View Menu
# ------------------------------------------------------
def view_menu
  $user.view_menu
end

# ------------------------------------------------------
# View Basket
# ------------------------------------------------------
def view_basket
  $user.view_basket
end

# ------------------------------------------------------
# Add to / Delete from Basket
# ------------------------------------------------------
def add_to_basket
  puts "Please select a dish number from #{$user.menu_ids.map(&:to_i).min} - #{$user.menu_ids.map(&:to_i).max}"
  id = get_input_number($user.menu_ids)
  begin
    $user.add_to_basket(id)
    success_msg("Added #{$menu.get_item(id)["dish"]} x 1 to basket")
  rescue StandardError => e
    puts e.message
  end
end

def delete_from_basket
  return if empty_basket?
  puts "Please select a number to remove: #{$user.basket_item_ids.join(",")}"
  id = get_input_number($user.basket_item_ids)
  begin
    $user.delete_from_basket(id)
    success_msg("Deleted #{$menu.get_item(id)["dish"]} x 1 from basket")
  rescue StandardError => e
    puts e.message
  end
end

def empty_basket?
  if $user.basket_item_ids.empty?
    puts "No items to delete"
    true
  else
    false
  end
end

def get_input_number(valid_list)
  loop do
    input = gets.chomp
    return input if valid_list.include?(input)
    puts "Please enter a valid number"
  end
end

# ------------------------------------------------------
# Check Out
# ------------------------------------------------------
def check_out
  view_basket
  begin
    $user.check_out
    success_msg("Successfully checked out")
  rescue StandardError => empty_basket
    e.message
  end
end

# ------------------------------------------------------
# Util
# ------------------------------------------------------
def success_msg(msg)
  divider_len = GlobalConstants::DIVIDER_LEN
  section_div = GlobalConstants::SECTION_DIV

  puts section_div * divider_len
  puts msg
  puts section_div * divider_len
end

# ------------------------------------------------------
# Exit
# ------------------------------------------------------
def exit_app
  exit
end

# ------------------------------------------------------
# Main
# ------------------------------------------------------
interactive_menu