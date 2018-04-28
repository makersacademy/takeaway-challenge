require 'take_away'

describe TakeAway do

  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double :menu, :list => {} }

  describe "#initialize" do
    it "has a menu list" do
      expect(takeaway.menu).to eq menu
    end
  end

  describe "#read_menu" do
    it "returns the menu" do
      expect(takeaway.read_menu).to eq menu.list
    end
  end

  describe "#order" do
    it "selects dishes" do
      dish = "southern chicken"
      quantity = 1
      expect(takeaway.order(dish, quantity)).to eq "#{quantity}x #{dish}(s) added to your basket"
    end

  end
end
