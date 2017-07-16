require './lib/takeaway.rb'

# Create Takeaway
# Create three Dishes
dishes = { "Onion Bhaji" => 2.50, "Chicken Tikka Masala" => 7.20, "Bombay Aloo" => 2.50, "Garlic Naan" => 2.10, "Vegetable Samosa" => 2.50 }
takeaway = Takeaway.new dishes
p takeaway
p takeaway.display_menu
