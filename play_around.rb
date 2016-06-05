Dir["./lib/*.rb"].each {|file| require file }

menu = {"rice" => 1,
        "pasta" => 1,
        "bread" => 1}
marlon = Customer.new(menu)
marlon.choose("rice", 3)
marlon.choose("bread", 4)
p marlon.order
marlon.pay(7)
