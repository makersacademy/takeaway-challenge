require_relative "takeaway"

@takeaway = Takeaway.new

def interactive_menu
  puts "Welcome to Turco, what would you like to do?"
  loop do
    options_menu
    options(STDIN.gets.chomp)
  end
end

def options_menu
  puts "1. See Menu Items"
  puts "2. Add to Order"
  puts "3. View Order"
  puts "4. Finish & Pay"
end

def options(selection)
  case selection
  when "1"
    see_menu_items
  when "2"
    add_to_order
  when "3"
    view_order
  when "4"
    finish_order
    exit
  else
    puts "Please enter a correct number"
  end
end

def see_menu_items
  puts "----"
  puts "MENU"
  @takeaway.view_menu.each { |k, v| puts "#{k}: $ #{v}" }
  puts "---"
  # options_menu
  # options(STDIN.gets.chomp)
end

def add_to_order
  puts "Please enter the item you would like to order:"
  @takeaway.add(STDIN.gets.chomp)
  # options_menu
  # options(STDIN.gets.chomp)
end

def view_order
  @takeaway.order.details.each do |item| 
    puts "#{item[:name]}: $ #{item[:price]}"
  end
  puts "Total: $ #{@takeaway.order.total}"
end

interactive_menu
