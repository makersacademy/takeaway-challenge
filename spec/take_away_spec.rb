require 'take_away'

describe TakeAway do

  subject(:take_away) { described_class.new }

  describe 'class' do
    it 'creates an instance of a class' do
      expect(take_away).to be_a(TakeAway)
    end
  end

  describe '#read_menu' do
    it 'prints menu upon request' do
      expect { take_away.read_menu }.to output.to_stdout
    end
  end

  describe '#add_to_order' do
    it 'prints items that were added to the order' do
      expect { take_away.add_to_order(1,1) }.to output.to_stdout
    end
    context 'if dish is not on menu' do
      it 'raises an error ' do
        message = "Please select dish from the menu."
        expect { take_away.add_to_order(40,2) }.to raise_error(message)
      end
    end
  end

  describe '#place_order' do
    let(:order) { double :order}
    it { is_expected.to respond_to(:place_order).with(0).argument }
  end

  describe '#show_order_details' do
    let(:order_hash) { { 1 => 3, 6 => 2, 9 => 1} }
    before do
      allow(take_away).to receive(:finalize_order)
    end
    context 'if order was not placed' do
      it 'raises an error ' do
        message = "Order can't be found: looks like nothing has been ordered yet. Please add to the order first."
        expect { take_away.show_order_details }.to raise_error(message)
      end
    end
  end

end
