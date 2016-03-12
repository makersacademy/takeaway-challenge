require_relative "../lib/menu"

gbk = {"avocado bacon burger" => 9.45,
"kiwiburger" => 9.35,
"salvador burger" => 10.55,
"skinny fries" => 2.95,
"onion rings" => 3.50,
"oreo milkshake" => 4.75,
"peanut butter milkshake" => 4.75,
"elderflower" => 2.35,
"froyo" => 2.50}

menu = Menu.new
menu.load(gbk)
p menu.display
