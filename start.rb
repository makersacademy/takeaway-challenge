require 'twilio-ruby'
require './lib/app'
require './lib/formatter'
require './lib/menu'
require './lib/sms'

sms = SMS.new
formatter = Formatter.new
menu = Menu.new(formatter)
app = App.new(sms, menu, formatter)
app.run
