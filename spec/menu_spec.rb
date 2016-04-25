require 'menu'

describe Menu do
	let(:dish_class) { double(:dish_class, name: "Sashimi", print_price: "6.20" ) }
	let(:dish_spy) { spy(:dish) }
	let(:menu) { described_class.new(dish_spy) }

	describe "#add_dish" do
		it 'adds a dish to the menu' do
			menu.add_dish(1, "Sahimi", 6.20)
			expect(menu.dishes["1"]).to include dish_spy
		end
	end

	describe '#print' do
		it 'prints the menu' do
			menu = Menu.new(dish_class)
			allow(dish_class).to receive(:new).and_return(dish_spy)
			menu.add_dish(1, "Sashimi", 6.20)
			menu.print
			expect(dish_spy).to have_received(:name)
		end
	end
end