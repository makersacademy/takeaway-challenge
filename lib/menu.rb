# I would like to see a list of dishes with prices

def print_menu

  restaurant_menu = {
    "chocolate cake" => 3,
    "apple crumble" => 2,
    "brownie" => 1,
    "lemon drizze" => 4,
    "pear and apple" => 3
  }
  restaurant_menu.each do |item, price|
    puts "#{item}: £#{price}"
  end

end
