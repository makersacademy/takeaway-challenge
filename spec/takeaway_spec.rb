require 'takeaway'

describe Takeaway do
  subject(:takeaway)  { described_class.new(dispatch) }
  let(:dispatch)      { double :order_dispatch }
  let(:order)         { double :order }

  describe '#view_menu' do
    it { is_expected.to respond_to(:view_menu) }

    it 'prints the menu' do
      expect { takeaway.view_menu }.to output.to_stdout
    end
  end

  describe '#place_order' do
    it { is_expected.to respond_to(:place_order) }

    it 'creates a new order' do
      expect(dispatch).to receive(:new_order) { order }
      takeaway.place_order(order)
    end
  end
end
