require 'menu'
 
describe Menu do
  subject(:menu) { described_class.new }
  let(:order) { double :fake_order }

  describe '#display_menu' do
    it "should return the menu as a 'nice' string" do
      expect(menu.display_menu).to eq "Fish: £7\nChips: £3"
    end
    it "handles menus from various restaurants" do
      menu = Menu.new(restaurant: "chickenshop.csv")
      expect(menu.display_menu).to eq "Chicken: £4\nChips: £1"
    end
  end
  describe '#order' do
    it 'passes the message to order object' do
      expect(order).to receive(:add)
      menu.order('Fish', 1, order: order)
    end
  end
  describe '#check_order' do
    it 'passes the message to order object' do
      expect(order).to receive(:receipt)
      menu.check_order(order: order)
    end
  end
end
