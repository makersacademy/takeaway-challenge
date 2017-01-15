require "basket"
describe Basket do
  let(:menu){double :menu}
  let(:menu_item){double :menu_item}
  subject{described_class.new menu}
  describe "#creation " do
    it "should start with an empty array" do
      expect(subject.items.size).to eq 0
    end
  end
  describe "#items " do
    it "should return an immutable array" do
      subject.items << 5
      expect(subject.items).not_to include 5
    end
  end
  describe "#add_item" do
    it "should add items" do
      allow(menu).to receive(:get_item).and_return menu_item
      subject.add menu_item
      expect(subject.items).to include menu_item
    end
  end

  describe "#total" do
    let(:item_1) {double :menu_item,price: 100}
    let(:item_2) {double :menu_item,price: 5}
    let(:item_3) {double :menu_item,price: 195}
    it "should total things up properly" do
      subject.instance_variable_set(:@contents, [item_1, item_2,item_3])
      expect(subject.total).to eq 300
    end
  end
  describe "#to_s" do
    it "should be able to print itself out" do
      expect{subject.to_s}.not_to raise_error
    end
  end
end
