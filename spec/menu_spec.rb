require 'menu'

describe Menu do

	let(:pasta) {double(:dish, name: "Pasta", number: 30, price: 3)}
	subject(:menu) {described_class.new}

	it 'should start with an empty list of dishes' do
		expect(menu.dishes).to eq({})
	end

	it 'can print a list of dishes' do
		menu.dishes[pasta.number] = pasta
		expect{menu.list}.to output("-----\n #{pasta.number}.#{pasta.name}\n £#{pasta.price}\n").to_stdout
	end
	
end