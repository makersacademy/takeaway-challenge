require_relative "./lib/menu"
require_relative "./lib/printer"
require_relative "./lib/takeaway"

MENU = Menu.new("./menu.json")
PRINTER = Printer.new
TAKEAWAY = Takeaway.new(MENU, PRINTER)