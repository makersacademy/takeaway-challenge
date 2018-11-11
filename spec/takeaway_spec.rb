require 'takeaway'
require 'menu'

describe TakeAway do
  describe '#view_menu' do
    it 'should' do

    end
  end
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
    end
    describe '#empty_basket' do
      it 'should show an empty array' do
        subject.empty_basket
        expect(subject.basket).to eq []
      end
    end
    describe '#check_basket' do
      it 'should' do

      end
    end
    describe '#submit_order' do
      it 'should' do

      end
    end
  end
end
