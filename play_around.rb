Dir["./lib/*.rb"].each {|file| require file }

menu = {"rice" => 1,
        "pasta" => 1,
        "bread" => 1,}
marlon = Customer.new(menu)
# marlon.see_menu
marlon.choose("rice", 3)
marlon.choose("bread", 5)
marlon.order.confirm(8)
