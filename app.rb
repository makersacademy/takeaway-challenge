require_relative "./lib/menu"
require_relative "./lib/takeaway"

MENU = Menu.new("./menu.json")
TAKEAWAY = Takeaway.new(MENU)

loop do
  TAKEAWAY.prompt
  puts "\n"
end