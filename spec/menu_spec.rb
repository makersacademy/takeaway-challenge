require 'menu'

describe Menu do 

subject(:menu) { described_class.new(dishes) }
 
let(:dishes) do
    {
      fish: 1.50,
      chips:1.00
    }
end 

    it "contains a list of items with prices" do 
        expect(menu.dishes).to eq(dishes)
    end 
    
    it "prints a list of dishes with prices" do
        printed_menu = "Fish £1.50, Chips £1.00"
        expect(menu.print).to eq(printed_menu)
    end 


end 