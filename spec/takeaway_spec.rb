require 'takeaway'
require 'stringio'

describe Takeaway do
  let(:orders) { double('ordering') }
  let(:takeaway) { Takeaway.new(orders) }

  describe '#view_menu' do
    it 'prints a menu' do
      expect(takeaway.view_menu).to include({ Burger: 4 })
    end
  end

  describe '#check_order' do
    let(:total) { StringIO.new("4") }
    it 'raises error if amount is incorrect' do
      allow(orders).to receive(:ordered) { { Burger: 1, Chips: 1 } }
      $stdin = total
      expect { takeaway.check_order }.to raise_error "Please recheck"
      $stdin = STDIN
    end
  end
end
