require "menu_item"

describe MenuItem do
  let(:dish) {double(:dish)}
  subject(:menu_item) {described_class.new("name", 10)}
  let(:item2) {described_class.new("name", 10, 0)}
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
      expect(item2.available?).to be false
    end
  end

end
