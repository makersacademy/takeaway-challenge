require 'menu'

describe Menu do
	subject(:menu){described_class.new(dishes)}
	let(:dishes) { {jajangmyun: 9.00, bibimbap: 9.00} }


	it 'returns an hash when using display method' do
    	expect(menu.dishes).to be_an_instance_of(Hash)
  	end

	it "displays dishes" do
		display_menu = "Jajangmyun £9.00\nBibimbap £9.00"
		expect(menu.display).to eq(display_menu)
	end

	it "check if dish on menu" do
		expect(menu.dish?(:jajangmyun)).to be true
	end

	it "check if dish not on menu" do
		expect(menu.dish?(:pie)).to be false
	end

	it "price of dish" do
		expect(menu.price(:jajangmyun)).to be 9.00
	end

end