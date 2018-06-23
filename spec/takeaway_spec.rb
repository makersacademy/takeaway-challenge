require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:menu) { described_class::MENU }
  let(:selection) { menu.last[:dish] }

  describe '#show_menu' do
    it 'shows a list of dishes and their prices' do
      expect(takeaway.show_menu).to eq menu
    end
  end
  describe '#order' do
    it 'lets user select a dish' do
      expect(takeaway.order(selection)).to eq "1 x #{selection}"
    end
    it 'lets user select a specific amount of a dish' do
      expect(takeaway.order(selection, 5)).to eq "5 x #{selection}"
    end
  end
end
