require 'takeaway'

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

describe TakeAway do
  subject(:t) {described_class.new}
  let(:quantity) {double(:quantity)}

  it "reads menu" do
    expect(t.read_menu).to eq ({"pizza" => 4.99, "soup" => 1.99})
  end

  describe "#order" do
    it "places order of 2 items into basket" do
      t.order("soup", quantity)
      expect(t.basket.items).to eq [{"soup" => quantity}]
    end

    it "raises error if non-menu item ordered" do
      expect{t.order("sldkfjx", quantity)}.to raise_error "That item is not on the menu. Try another dish."
    end

    xit "tells the user that their item was added to the basket" do
      t.order("soup", quantity)
      expect(STDOUT).to receive(:puts).with("#{quantity}x soup(s) added to your basket.")
    end
  end

  describe "#basket_summary" do
    it "returns a summary of the items in basket" do
      expect(t.basket_summary)
    end
  end
end
