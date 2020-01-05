require_relative "takeaway"

@takeaway = Takeaway.new

def interactive_menu
  puts "Welcome to Turco2.0, what would you like to do?"
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
  puts "----".center(20)
  puts "MENU".center(20)
  @takeaway.view_menu.each { |k, v| puts "#{k}: $ #{v}".center(20) }
  puts "---".center(20)
end

def add_to_order
  puts "Please enter the item you would like to order:"
  @takeaway.add(STDIN.gets.chomp)
end

def view_order
  @takeaway.view_order
  puts "Total: $ #{@takeaway.order.total}"
end

def finish_order
  puts @takeaway.order.total
  puts "Enter payment amount:"
  @takeaway.submit_order(STDIN.gets.chomp.to_i)
end

interactive_menu
