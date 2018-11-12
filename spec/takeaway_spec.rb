require 'takeaway'

describe TakeAway do
  describe 'a group of tests that require an item to be added to the basket' do
    before do
      subject.add_to_order(2)
    end

    describe '#add_to_order' do
      it 'should update the cost' do
        expect(subject.cost).to eq 7
      end
      it 'should add the item to the basket' do
        expect(subject.basket).to eq ["American Hot Pizza £7"]
      end

      describe 'a further group of tests that require another item' do
        before do
          subject.add_to_order(4,2)
        end
        it 'second parameter should add that quantity to the basket' do
          arr = ["American Hot Pizza £7", "Madras Curry £8", "Madras Curry £8"]
          expect(subject.basket).to eq arr
        end
        it 'second parameter should add that quantity to the cost' do
          expect(subject.cost).to eq 23
        end
      end
    end

    describe '#empty_basket' do
      before do
        subject.empty_basket
      end
      describe 'a further group of tests that require empty basket' do
        it 'basket should show an empty array' do
          expect(subject.basket).to eq []
        end
        it 'cost should reset to 0' do
          expect(subject.cost).to eq 0
        end
      end
    end

    describe '#check_basket' do
      it 'should return string stating total cost' do
        message = "Total cost of items in basket: £7"
        expect(subject.check_basket).to eq message
      end
    end
    describe '#submit_order' do
      it 'should return the message sid confirming a text has been sent' do
        expect(subject.submit_order).to start_with("SM")
        expect(subject.submit_order).to have_attributes(length: 34)
      end
    end
  end
end
