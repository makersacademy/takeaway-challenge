require 'menu'

describe Menu do

	subject(:menu) {described_class.new}
	let(:pasta) {double(:dish, name: "Pasta", price: 3)}

	it 'should start with an empty list of dishes' do
		expect(menu.dishes).to eq []
	end

	context 'methods' do

		before(:each) { menu.add_dish(pasta)}

		it 'can add dishes to the list' do
			expect(menu.dishes).to include(pasta)
		end

		it 'can print a list of dishes' do
			expect{menu.list_dishes}.to output("-----\n #{pasta.name}\n £#{pasta.price}\n").to_stdout
		end

	end
	
end