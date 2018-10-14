

require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }
  let(:menu) {double:menu, display:'Chicken Tikka: 5.25, Lamb Biryani: 9.50' }

  describe '#view_menu' do
    it 'shows list of dishes with prices' do
      expect(takeaway.view_menu).to eq menu.display
    end
  end
end
