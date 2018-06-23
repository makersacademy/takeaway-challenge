require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }

  describe '#show_menu' do
    it 'shows a list of dishes and their prices' do
      expect(takeaway.show_menu).to eq dosa: '£6', curry: '£12'
    end
  end
  describe '#order' do
    it 'lets user select a dish' do
      expect(takeaway.order('dosa')).to eq '1 x dosa'
    end
    it 'lets user select a specific amount of a dish' do
      expect(takeaway.order('curry', 5)).to eq '5 x curry'
    end
  end
end
