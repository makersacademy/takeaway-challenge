require 'basket'

describe Basket do

    it { is_expected.to be_instance_of Basket }

    describe "#select_dish" do
        it { is_expected.to respond_to :select_dish }

        it 'adds an item to the order' do
            expect { subject.select_dish("Pizza", 3) }.to change { subject.order }.to [{"Pizza"=>7}, {"Pizza"=>7}, {"Pizza"=>7}]
        end

        it 'raises an error if dish is not on the menu' do
            expect {subject.select_dish("Pasta")}.to raise_error "Error, item not found!"
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
            subject.check_total
            expect{subject.checkout(10)}.to raise_error "Wrong payment amount!"
        end

        it 'should pass along a message showing that the order has gone through' do
            subject.select_dish("Beef Taco")
            subject.check_total
            expect{subject.checkout(5)}.to output('Thank you, your order has been placed!').to_stdout
        end
    end

    
     
end