require 'basket'

describe Basket do

    it { is_expected.to be_instance_of Basket }

    describe "#select_dish" do
        it { is_expected.to respond_to :select_dish }

        it 'adds an item to the order' do
            expect { subject.select_dish("Pizza") }.to change { subject.order }.to [1, {"Pizza"=>7}]
        end



    end
     
end