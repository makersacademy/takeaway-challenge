require 'takeaway'

describe Takeaway do
    subject (:takeaway) {Takeaway.new}
    #let (:menu) {double :menu}

    describe '#view_menu' do
        it { is_expected.to respond_to(:view_menu) }

        it 'lists all purchasable items' do
            #arrange
            #assert
            expect(takeaway.view_menu).to eq(@menu)
        end 

    
            
    end


end