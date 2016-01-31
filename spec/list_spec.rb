require 'list'

describe List do 
	subject(:list) { described_class.new(dishes) }

	let(:dishes) do
	 {
		chicken_tandoori: 9.99, 
		lamb_handi: 9.99,
		# chicken_jalfrezi: 9,
		# biryani: 7,
		# king_prawn_special: 11,
		# pilau_rice: 2,
		# tandoori_roti: 1,
	 }
	end
	it "has a number of dishes including prices" do
			expect(list.dishes).to eq(dishes)
	end
	
	it "displays a list of dishes of with prices" do
		displayed_list = "Chicken_tandoori £9.99, Lamb_handi £9.99"
		expect(list.display).to eq(displayed_list)
	end
end
