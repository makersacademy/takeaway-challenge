require 'takeaway'

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
        expect(t.basket).to eq ['Brains', 'Brains']
      end
    end
    it 'raises error if item not in menu' do
      expect { t.order('food') }.to raise_error 'Item not available'
    end
  end

  describe '#verify_order' do
    it 'responds to' do
      expect(t).to respond_to(:verify_order).with(1).argument
    end

    context 'checks cost of ordering Brains' do
      before { t.order('Brains') }

      it 'calculates order total' do
        expect(t.verify_order(5)).to eq 5
      end

      it 'raises error if #verify_order arg not eq to basket value' do
        expect { t.verify_order(10) }.to raise_error "Conflict in total cost"
      end
    end

  end
end
