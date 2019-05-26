require './lib/app'
require './lib/menu'
require './lib/order'
require './lib/twilio'

app = App.new
app.select_dish("Margherita", 2)
