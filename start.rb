require 'twilio-ruby'
require './lib/app'
require './lib/formatter'
require './lib/menu'
require './lib/order'
require './lib/basket'
require './lib/sms'

SID = ''
TOKEN = ''

sms = SMS.new(Twilio::REST::Client.new(SID, TOKEN).api.account.messages)
formatter = Formatter.new
menu = Menu.new(formatter)
app = App.new(sms, menu, Basket, Order, formatter)
app.run
