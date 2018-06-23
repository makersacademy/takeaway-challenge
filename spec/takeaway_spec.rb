require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }

  describe '#show_menu' do
    it 'shows a list of dishes and their prices' do
      expect(takeaway.show_menu).to eq dosa: '£6', curry: '£12'
    end
  end
end
