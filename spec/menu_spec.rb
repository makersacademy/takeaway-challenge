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

end