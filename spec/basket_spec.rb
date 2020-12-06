require 'basket'

describe Basket do

    it { is_expected.to be_instance_of Basket }

    describe "#select_dish" do
        it { is_expected.to respond_to :select_dish }

        it 'adds an item to the order' do
            expect { subject.select_dish("Pizza", 3) }.to change { subject.order }.to [{"Pizza"=>7}, {"Pizza"=>7}, {"Pizza"=>7}]
        end
    end

    describe "#check_total" do
        it  'should check the total cost of the items in basket' do
            subject.select_dish("Pizza")
            subject.select_dish("Burger")
            subject.select_dish("Ice-cream")
            expect(subject.check_total).to eq "Your Total Comes to: £20."
        end
    end

    describe "#checkout" do
        it 'should compare the payment with the total' do
            subject.select_dish("Pizza")
            subject.select_dish("Burger")
            expect{subject.checkout(10)}.to raise_error "Wrong total!"
        end
    end

    
     
end