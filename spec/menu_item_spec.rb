require "menu_item"

describe MenuItem do
  subject(:menu_item) {described_class.new("name", 10)}
  let(:menu_item2) {described_class.new("name", 10, 0)}
  describe "when instantiated" do

    it "there should be a default amount" do
      expect(menu_item.amount).to eq MenuItem::DEFAULT_AMOUNT
    end
  end

  describe "when managing a menu item" do

    it "should return true if there are any available" do
      expect(menu_item.available?).to be true
    end

    it "should return false if there are no available" do
      expect(menu_item2.available?).to be false
    end

    it "should be able to deduct from the amount" do
      menu_item.deduct(1)
      expect(menu_item.amount).to eq 0
    end

    context "when deducted more than available" do
      it "should raise an error" do
        expect{menu_item.deduct(2)}.to raise_error("There's only 1 left")
      end
    end
  end

end
