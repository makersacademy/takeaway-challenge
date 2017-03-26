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
      expect(t.basket).to eq [{"soup" => quantity}]
    end

    it "raises error if non-menu item ordered" do
      expect{t.order("sldkfjx", quantity)}.to raise_error "That item is not on the menu. Try another dish."
    end
  end

  describe "#basket_summary" do
    it "returns a summary of the items in basket" do
      t.order("soup", 4)
      t.order("pizza", 2)
      expect(t.basket_summary).to eq ("soup x 4 = £7.96, pizza x 2 = £9.98")
    end
  end

  describe "#total" do
    it "returns the total cost of items in basket" do
      t.order("soup", 4)
      t.order("pizza", 2)
      expect(t.total).to eq "Total: £17.94"
    end
  end
end
