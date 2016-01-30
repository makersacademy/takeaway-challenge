require 'takeaway.rb'

describe Takeaway do
  let(:menu) { double :menu }
  let(:menu_klass) { double :menu_klass, new: menu }
  subject(:takeaway) { described_class.new(menu_klass) }

  describe '#menu' do
    it 'returns a copy of the menu' do
      allow(menu).to receive(:dishes) { {'prawn crackers' => 2} }
      expect(takeaway.menu).to eq ({'prawn crackers' => 2})
    end


  end
end
