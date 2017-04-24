require './lib/order'

describe Order do
    
    let(:test_menu) { double(:dishes => [{:dish => "Soup", :price => 7.00}, {:dish => "Salad", :price => 8.00}, {:dish => "Calmari", :price => 6.50}]) }
    
    describe '#menu' do
        before(:example) { subject.add_menu(test_menu) }
        
        it "Gives me a menu from which to order" do
            expect(subject.menu).to eq test_menu
        end
        
        it "Gives the menu with each item numbered" do
            expect { subject.show_menu }.to output("1. #{test_menu.dishes[0][:dish]} #{test_menu.dishes[0][:price]}\n2. #{test_menu.dishes[1][:dish]} #{test_menu.dishes[1][:price]}\n3. #{test_menu.dishes[2][:dish]} #{test_menu.dishes[2][:price]}\n").to_stdout
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
    
    describe '#total_bill' do
        before(:example) { subject.add_menu(test_menu) }
        before(:example) { subject.order(1, 2, 3) }
        
        it 'Gives the total amount for the order' do
            expect(subject.total_bill).to eq(21.50)
        end
    end
    
    let(:printed_menu) { "#{test_menu.dishes[0][:dish]} 1 #{test_menu.dishes[0][:price]}\n#{test_menu.dishes[1][:dish]} 1 #{test_menu.dishes[1][:price]}\n#{test_menu.dishes[2][:dish]} 1 #{test_menu.dishes[2][:price]}\n" }
    
    describe '#print_bill' do
        
        before(:example) { subject.add_menu(test_menu) }
        before(:example) { subject.order(1, 2, 3) }
        
        it 'Prints out the bill with the dishes with the quanities' do
            expect{ subject.print_bill }.to output(printed_menu).to_stdout
        end
        
    end
    
end