require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }
  let(:menu) { double :menu, print: printed_menu }
  let(:printed_menu) { "tomato soup, 2.00" }

  describe '#display_menu' do
    it 'shows a list of dishes with prices' do
      expect(takeaway.display_menu).to eq(printed_menu)
    end
  end
end
