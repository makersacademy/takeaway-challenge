require 'order'

describe Order do

  describe "confirm order" do

  # let(:user) { "complete order" }

    xit 'should allow user to confirm order' do
      allow(Order).to receive(:user).and_return("complete order")
      expect subject.checkout_confirmation
    end
  end

  describe '#add dishes' do
    context 'when a customer selects a dish' do
      it 'it should change the order by adding a dish to it' do
        expect { subject.add(1) }.to change(subject, :selection)
      end
    end


    context 'when a customer selects a meal' do
      it 'it should add the cost of that dish to the total' do
        expect { subject.add(1) }.to change(subject, :total)
      end
    end

    context 'when a customer selects a dish' do
      it 'it should change the confirmation message accordingly' do
        expect { subject.add(1) }.to change(subject, :item_added_confirmation)
      end
    end

  describe '#summary' do
      context 'when a customer has finished choosing meals and clicks on checkout' do
        it 'should show the customer their summary' do
          subject.add(1)
          subject.stub(:gets) {"complete order"}
          expect(subject.checkout).to include(subject.selection)
        end

        it 'should prompt the customer to compare the total against the order summary' do
          subject.add(1)
          subject.stub(:gets) {"complete order"}
          expect(subject.checkout).to include("Please check your order against your total:")
        end
      end
    end
  end
end
