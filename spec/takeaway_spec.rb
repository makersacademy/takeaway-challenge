require 'takeaway'

describe Takeaway do
  subject(:takeaway)  { described_class.new(order) }
  let(:order)         { double :order }
  let(:dishes)        { double :array }

  describe '#initialize' do

  end

  describe '#view_menu' do
    it { is_expected.to respond_to(:view_menu) }

    it 'prints the menu' do
      expect { takeaway.view_menu }.to output.to_stdout
    end
  end

  describe '#place_order' do
    it { is_expected.to respond_to(:place_order) }

    it 'initializes a new order' do
      expect(order).to receive(:new)
      takeaway.place_order(dishes)
    end
  end
end
