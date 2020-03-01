require 'order'

describe Order do 

    # This test group is for test class methods response
  it { is_expected.to respond_to(:selected_items) }
  it { is_expected.to respond_to(:final_amount) }
  it { is_expected.to respond_to(:select_items) }
  it { is_expected.to respond_to(:in_the_menu?) }
  it { is_expected.to respond_to(:final_order_check)}

    describe '#select_items' do 
        it 'is expected to contain' do 
            expect(subject.select_items("fajita",1)).to eq "You have chosen 1,fajita"
        end
        
        it 'fails if the selected item is not in the menu list' do
            expect { subject.select_items("Iceream",1) }.to raise_error 'The selected item does not exist'
        end

        it 'will add correctly the dishes for prepare the order' do 
            subject.select_items("fajita",2)
            expect(subject.selected_items).to eq ["fajita","fajita"]
        end
    end

    describe '#in_the_menu?' do 

        it 'is expected to return true or false' do
             item = "fajita"
            expect(subject.in_the_menu?(item)).to eq true
             item = "icecream"
            expect(subject.in_the_menu?(item)).to eq false
        end
    end

    describe '#sum_items' do 
        it 'is expected to sum the values of the dishes' do
            subject.select_items("fajita",2)
            expect(subject.sum_items).to eq 12
        end
    end

    describe '#final_order_check' do 
        it 'is expected to show the final order and the amount charged' do 
            subject.select_items("fajita",3)
            expect(subject.final_order_check).to eq "You will be charged 18 pounds"
        end
    end
end