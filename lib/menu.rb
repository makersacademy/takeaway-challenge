class Menu

attr_reader :current_menu

def current_menu
current_menu = {
	"Margherita " => 5.50,
	"Quattro stagioni" => 7,
	"Pepperoni" => 8,
	"Pollo ad astra" => 6.50,
	"Green salad" => 4.50,
	"Dough balls" => 3.50,
	"Peroni" => 4.50,
	"Coca cola" => 3.00,
	"House white (bottle)" => 14,
	"House red (bottle)" => 14.20,
	"Sticky toffee pudding" => 4.20,
}
end

def print_menu
	current_menu
end

end