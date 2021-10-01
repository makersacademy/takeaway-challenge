require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu }
  let(:shop) { described_class.new(menu) }
  
  describe '#menu' do
    it "produces a menu" do
      expect(shop).to respond_to(:menu)
    end

    it "displays the menu" do
      expect(shop.menu).to eq menu
    end
  end

end
