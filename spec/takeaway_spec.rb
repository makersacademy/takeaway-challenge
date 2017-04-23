require 'takeaway'
require 'menu'

describe Takeaway do
  subject(:t) { described_class.new }
  let(:food) { double(:food) }

  describe '#read_menu' do
    context do
      it 'returns Brains in menu' do
        expect(t.read_menu).to include 'Brains'
      end
    end
  end

  describe '#order' do
    context 'stores multiples' do
      it 'stores two of one type' do
        t.order('Brains', 2)
        expect(t.basket).to eq ({'Brains' => [5, 2]})
      end
    end
    it 'raises error if item not in menu' do
      expect { t.order('food') }.to raise_error 'Item not available'
    end
  end

  describe '#checkout' do
    it 'responds to' do
      expect(t).to respond_to(:checkout).with(1).argument
    end

    context 'checks cost of ordering Brains' do
      before { t.order('Brains') }

      it 'calculates order total' do
        expect(t.checkout(5)).to eq 5
      end

      it 'raises error if #checkout arg not eq to basket value' do
        expect { t.checkout(10) }.to raise_error "Conflict in total cost"
      end
    end

    describe '#see_basket' do
      it 'displays basket contents' do
        t.order('Brains')
        expect(t.see_basket).to include 'Brains'
      end
    end

  end
end
