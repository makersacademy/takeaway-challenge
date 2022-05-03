require 'order'

describe Order do

  describe '#add dishes' do

    context 'when a customer selects an available dish' do
      it 'it should change the order by adding a dish to it' do
        expect { subject.add(1) }.to change(subject, :selection)
      end
    end

    context 'when a customer selects an unavailable dish' do
      it 'it should not let them pick a dish' do
        expect { subject.add(3) }.to raise_error 'item not available'
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
          expect(subject.checkout).to include(subject.selection)
        end

        it 'should prompt the customer to compare the total against the order summary' do
          subject.add(1)
          expect(subject.checkout).to include("Please check your order against your total:")
        end
      end
    end
  end

  describe '#complete_order' do
    context 'when a customer has checked their summary and enters complete_order' do
      it 'should call the SMS class' do
        subject.add(1)
        subject.checkout
        expect(subject).to respond_to(subject.complete_order).with(SMS.new.send_sms(ENV['MY_PHONE']))
      end
    end

    context 'when a customer has checked their summary and enters complete_order' do
      it 'should be instance of SMS' do
        subject.add(1)
        subject.checkout
        expect(subject.complete_order).to_(SMS.new.send_sms)
      end
    end
  end
end
