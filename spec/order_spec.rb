require './lib/order'

describe Order do
    
    let(:test_menu) { [{:dish => "Soup", :price => 7.00}, {:dish => "Salad", :price => 8.00}] }
    
    describe '#menu' do
        it "Gives me a menu from which to order" do
            expect(subject.show_menu(test_menu)).to eq test_menu
        end
        
        it "Gives the menu with each item numbered" do
            expect { subject.show_menu(test_menu) }.to output("1. #{test_menu[0][:dish]} #{test_menu[0][:price]}\n2. #{test_menu[1][:dish]} #{test_menu[1][:price]}\n").to_stdout
        end
    end
    
    it { is_expected.to respond_to(:order).with(1).arguments }
    
    # it "Allows me to order a dish and will add this to our order" do
    #     expect(subject
        
    # end
end