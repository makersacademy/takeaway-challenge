require "./lib/takeaway"


gbk = {"avocado bacon burger" => 9.45,
"kiwiburger" => 9.35,
"salvador burger" => 10.55,
"skinny fries" => 2.95,
"onion rings" => 3.50,
"oreo milkshake" => 4.75,
"peanut butter milkshake" => 4.75,
"elderflower" => 2.35,
"strawberry froyo" => 2.50}

menu = Menu.new
menu.upload(gbk)
takeaway = TakeAway.new(menu)
takeaway.order("kiwiburger", 2)
takeaway.order("elderflower", 2)
takeaway.basket_summary
takeaway.total
takeaway.complete_order(23.4)

let(:client) { double :client, account: account }
let(:accout) { double :account, messages: messages }
let(:messages) { double :messages, create: nil }
