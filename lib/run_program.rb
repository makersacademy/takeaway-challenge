require_relative 'order'

menu = Menu.new

menu.add_item(Item, "pizza", 8)
menu.add_item(Item, "burger", 10)
menu.add_item(Item, "chips", 3)

order = Order.new(menu)
order.selection
# order.send_sms(ENV["TWILIO_SID"], ENV["TWILIO_AUTH_TOKEN"], ENV["OUTBOUND_NUMBER"], ENV["INBOUND_NUMBER"], SendSMS)
order.send_sms(ENV["TEST_SID"], ENV["TEST_TOKEN"], ENV["TEST_OUTBOUND"], ENV["TEST_INBOUND"], FakeSMS)


