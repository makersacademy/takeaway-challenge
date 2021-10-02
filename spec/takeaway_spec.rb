require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu }
  let(:shop) { described_class.new(menu) }
  
  describe '#menu' do
    it "shows a menu" do
      expect(shop).to respond_to(:menu)
    end

    it "displays a menu" do
      expect(menu).to receive(:display)

      shop.menu
    end
  end

end
