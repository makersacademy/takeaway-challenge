require './lib/order'

describe Order do
    
    let(:menu) { [{:dish => "Soup", :price => 7.00}, {:dish => "Salad", :price => 8.00}] }
    
    it "Gives me a menu from which to order" do
        expect(subject.menu(menu)).to eq menu
        
    end
end