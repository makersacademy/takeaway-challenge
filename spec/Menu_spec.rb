require "Menu"

describe Menu do
    
    subject(:menu) { described_class.new(dishes) }

    let(:dishes) do
        
        {
            Plaice: 7.25,
            Vegetable_curry: 6.95
        }
    end
    
    it 'contains dishes and prices' do
        expect(menu.dishes).to eq(dishes)
    end
       
    it 'prints dishes and prices' do
        printed_menu = "Plaice £7.25, Vegetable_curry £6.95"
        expect(menu.printed_menu).to eq(printed_menu)
    end
    
    it 'shows whether dish is on menu' do
        expect(menu.has_dish?(:Plaice)).to be true
    end
    
    it 'shows whether dish is not on menu' do
        expect(menu.has_dish?(:Beef)).to be false
    end
    
    it "calculates a price" do
        expect(menu.price(:Plaice)).to eq(dishes[:Plaice])
    end

end