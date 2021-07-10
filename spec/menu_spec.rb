
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
    it "calls print on menu expecting to equal printed_menu" do
		printed_menu = "Dim_sum_platter £11.00, Shrimp_fu_yung £8.80, Mongolian_lamb £7.70, Egg_fried_rice £3.30, Prawn_crackers £2.00"
		expect(menu.print).to eq(printed_menu)
	end
end
