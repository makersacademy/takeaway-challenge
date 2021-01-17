require 'takeaway'
describe Takeaway do

  describe '#menu' do
    subject(:takeaway) { described_class.new(menu) }

    let(:menu) { double(:menu, display: show_menu) }
    let(:show_menu) { "Korma: £5.00" }

    it 'shows a list of dishes with prices' do
      expect(takeaway.show_menu).to eq(show_menu)
    end
  end
end
