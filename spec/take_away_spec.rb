require 'take_away'

describe TakeAway do

  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double :menu, :list => {"southern chicken" => 5.90} }

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
    it "adds the dishes to the basket" do
      dish = "southern chicken"
      takeaway.order(dish, quanity = 1)
      expect(takeaway.basket.length).to eq 1
    end

    it "prints the message" do
      dish = "southern chicken"
      expect(takeaway.order(dish, quantity = 1)).to eq "#{quantity}x #{dish}(s) added to your basket"
    end

  end
end
