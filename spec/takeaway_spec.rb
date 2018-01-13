require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new(menu_class: menu) }
  let(:menu) { double(:menu) }

  describe '#display_menu' do
    it 'displays the menu' do
      allow(menu).to receive(:show).and_return "First item: £price"
      expect(takeaway.display_menu).to eq "First item: £price"
    end
  end
end
