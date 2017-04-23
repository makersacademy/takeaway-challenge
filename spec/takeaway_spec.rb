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
        expect(t.view_basket).to include({ 'Brains' => [5, 2] })
      end
    end
    it 'raises error if item not in menu' do
      expect { t.order('food') }.to raise_error 'Item not available'
    end
  end

  describe '#total' do
    before { t.order('Brains') }
      specify { expect { t.total }.to output("Total: £5\n").to_stdout }
  end

  describe '#checkout' do
    context 'checks cost of ordering Brains' do
      before { t.order('Brains') }

      it 'raises error if #checkout arg not eq to basket value' do
        expect { t.checkout(10) }.to raise_error "Conflict in total cost"
      end
    end

    describe '#view_basket' do
      it 'displays basket contents' do
        t.order('Brains')
        expect(t.view_basket).to include 'Brains'
      end
    end

  end
end
