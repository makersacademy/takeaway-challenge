require 'takeaway'

describe Takeaway do
  let(:items) { "Burger" }
  let(:quantities) { 1 }

  describe '#view_menu' do
    it 'prints a menu' do
      expect(subject.view_menu).to include({ Burger: 4 })
    end
  end

  describe '#check_order' do
    it 'raises error if amount is incorrect' do
      expect { subject.check_order }.to raise_error "Please recheck"
    end
  end
end
