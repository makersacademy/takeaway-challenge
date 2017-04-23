require './lib/order'

describe Order do
    
    let(:test_menu) { double(:dishes => [{:dish => "Soup", :price => 7.00}, {:dish => "Salad", :price => 8.00}]) }
    
    describe '#menu' do
        before(:example) { subject.add_menu(test_menu) }
        
        it "Gives me a menu from which to order" do
            expect(subject.menu).to eq test_menu
        end
        
        it "Gives the menu with each item numbered" do
            expect { subject.show_menu }.to output("1. #{test_menu.dishes[0][:dish]} #{test_menu.dishes[0][:price]}\n2. #{test_menu.dishes[1][:dish]} #{test_menu.dishes[1][:price]}\n").to_stdout
        end
    end
    
    it { is_expected.to respond_to(:order).with(1).arguments }
    
    describe '#order' do
        
        before(:example) { subject.add_menu(test_menu) }
        
        it "Stores the dishes ordered" do
            expect(subject.order(1)).to include test_menu.dishes[0]
        end
        
        it "Can receive several 'dishes' at once and add these to the order" do
            expect(subject.order(1, 2, 3)).to include(test_menu.dishes[0]).and include(test_menu.dishes[1]).and include(test_menu.dishes[2])
        end
        
    end

end