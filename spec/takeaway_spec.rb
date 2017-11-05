require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }

  before do
    allow(takeaway).to receive(:check_out)
  end

    describe '#menu' do
      context 'when requesting to see the menu' do
        it 'should show the menu' do
          expect(takeaway.menu).to eq takeaway.menu
        end
      end
    end

    describe '#order' do
      context 'when selecting a dish' do
        it 'should be added to basket' do
          expect(takeaway.order('Chips')).to eq takeaway.basket
        end
      end
      context 'when adding dishes to your order' do
        it 'order total should be the sum of dishes added' do
          takeaway.order('Chips')
          takeaway.order('Chips')
          expect(takeaway.total).to eq 4
        end
      end
    end

    describe '#total' do
      context 'when checking order total' do
        it 'should return order total' do
          expect(takeaway.total).to eq takeaway.total
        end
      end
    end

    describe '#empty_basket' do
      context 'when trying to checkout with an empty basket' do
        it 'should raise an error' do
          expect { takeaway.empty_basket? }.to raise_error "You haven't ordered anything!"
        end
      end
    end


end
