require_relative "takeaway"

SAMPLE_MENU = {
  Salad: 3.5,
  Soup: 3,
  Pizza: 6,
  Pasta: 5,
  Tiramisu: 4.5,
  Gelato: 4,
  Coffee: 2.5
}.freeze

account_sid = "YOUR ACCOUNT_SID HERE"
auth_token = "YOUR AUTH_TOKEN HERE"
client = Twilio::REST::Client.new(account_sid, auth_token)

text_args = {

  from: "YOUR TWILIO NUMBER HERE",
  to: "YOUR MOBILE NUMBER HERE"
}

text = SMS.new(client, account_sid, auth_token, text_args[:from], text_args[:to]) 
menu = Menu.new(SAMPLE_MENU)
take_away = Takeaway.new(menu, text) 

take_away.build_order(:Soup, 2)
take_away.build_order(:Pizza, 1)
take_away.build_order(:Coffee, 2)
take_away.display_order
take_away.confirm_order
