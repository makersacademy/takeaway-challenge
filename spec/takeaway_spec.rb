require 'takeaway'
require 'menu'

describe Takeaway do

  let(:menu) { double :menu }
  let(:menu_klass) { double :menu_klass, new: menu }
  subject(:takeaway) { described_class.new(menu_klass) }

  describe '#menu' do

    it 'allows the user to see a copy of the menu' do
      allow(menu).to receive(:dishes) { {'pizza' => 4} }
      expect(takeaway.menu).to eq ({'pizza' => 4})
    end
    
  end
end
