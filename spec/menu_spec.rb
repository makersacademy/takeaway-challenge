
require 'menu'

describe Menu do
    subject(:menu) { described_class.new(dishes) }  

	let(:dishes) do
		{  
    dim_sum_platter: 11.00,
    shrimp_fu_yung:  8.80,
    mongolian_lamb:  7.70,
    egg_fried_rice:  3.30,
    prawn_crackers:  2.00
		}
	end

	it "accesses dishes attribute of menu class expecting it to equal dishes hash of (dish/price, key/value) pairs" do
		expect(menu.dishes).to eq(dishes)
	end
end
