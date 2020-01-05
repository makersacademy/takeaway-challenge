require '../lib/takeaway.rb'
require '../lib/menu_printer.rb'
require '../lib/sms_sender.rb'

# Warning - this will send a real text message if your ENV files are set up correctly

example = Takeaway.new(MenuPrinter, Sms.new(ENV["TWILIO_ID"], ENV["TWILIO_TOKEN"], ENV["TWILIO_NUM"]))
example.show_menu
example.place_order("pepperoni_pizza, 2, wedges, 4, fanta, 2, 51.92, #{ENV["MY_NUM"]}")
