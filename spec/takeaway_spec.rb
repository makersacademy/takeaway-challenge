require 'takeaway'

describe Takeaway do
    subject (:takeaway) {Takeaway.new}

    describe '#view_menu' do
        it { is_expected.to respond_to(:view_menu) }

        it 'lists all purchasable items' do
            #arrange
            #assert
            expect(takeaway.view_menu).to eq({  
                :Beer => 4.00,
                :Cola => 2.50,
                :Tap_water => 0.50,
                :Burger => 6.00,
                :Veggie_burger => 5.00,
                :Chips => 2.00,
                :Salad => 3.50 
            })
        end        
    end

    describe '#select_item' do
        it { is_expected.to respond_to(:select_item)}

    end


end