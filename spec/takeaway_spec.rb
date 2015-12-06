require 'takeaway'

describe TakeAway do
  let(:menu) { double :menu }
  let(:menu_klass) { double :menu_klass, new: menu}
  let(:takeaway) { described_class.new(menu_klass) }

  describe '#menu' do
    it 'has to show dishes available in menu' do
      expect(takeaway.menu).to eq menu
    end
  end
end
