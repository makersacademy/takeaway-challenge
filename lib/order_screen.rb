require_relative "takeaway"

@takeaway = Takeaway.new

def welcome
  puts "Welcome to Turco, what would you like to do?"
  options_menu
  options(STDIN.gets.chomp)
end

def options_menu
  puts "1. See Menu Items"
  puts "2. Start Order"
  puts "3. Add to Order"
  puts "4. Finish & Pay"
  puts "5. View Order"
  puts "9. End"
end

def see_menu_items
  puts "----"
  puts "MENU"
  @takeaway.view_menu.each { |k, v| puts "#{k}: $ #{v}" }
  puts "---"
  options_menu
  options(STDIN.gets.chomp)
end

def start_order
  puts "Please enter the item you would like to order:"
  @takeaway.add(STDIN.gets.chomp)
  options_menu
  options(STDIN.gets.chomp)
end

def add_to_order
  puts "Please enter the item you would like to order:"
  @takeaway.add(STDIN.gets.chomp)
  options_menu
  options(STDIN.gets.chomp)
end

def view_order
  @takeaway.order.details.each do |item| 
    puts "#{item[:name]}: $ #{item[:price]}"
  end
  puts "Total: $ #{@takeaway.order.total}"
end

def options(selection)
  case selection
  when "1"
    see_menu_items
  when "2"
    start_order
  when "3"
    add_to_order
  when "4"
    finish_order
  when "5"
    view_order
  when "9"
    exit
  else
    puts "Please enter a correct number"
  end
end

welcome
