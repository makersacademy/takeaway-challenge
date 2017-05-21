require 'menu'

describe Menu do

	 subject(:menu) { described_class.new(dishes) }

  let(:dishes) do 
  	 {
   		"spring roll" => 0.99,
   		"char sui bun" => 3.99,
   	}
  end
	it "has a list of dishes with prices" do
 	expect(menu.dishes).to eq(dishes)
 	end

 	it "prints a list of dishes with prices" do
 		printed_menu = "Spring roll £0.99, Char sui bun £3.99"
 		expect(menu.print).to eq(printed_menu)
 	end

 	it "tells if a dish is on the menu" do
 		expect(menu.has_dish?(:beef)).to be false
 	end

end
