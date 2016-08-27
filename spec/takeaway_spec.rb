require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double :menu }

  describe '.view_menu' do
    it 'returns the menu' do
      allow(menu).to receive(:format_menu)
      expect(takeaway.view_menu).to eq menu
    end

  end

end
