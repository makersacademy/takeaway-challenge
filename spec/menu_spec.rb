require "./lib/menu.rb"

describe Menu do
  subject(:menu) {described_class.new}
  let(:item) {double(:item)}

  before do
      allow(item).to receive(:name)       {"Salmon roll"}
      allow(item).to receive(:price)      {7.0}
  end

  describe "#initialize" do

    it "initializes with a blank array for the list of items" do
      expect(menu.item_list).to eq []
    end
  end

  describe "#add items to list" do

    it "allows new items to be added to the list of items" do
      expect(menu.add_item(item)).to eq menu.item_list
    end

  end

  describe "#show list of items (formatted)" do

    it "returns all the items in item_list in a nicely formatted way with the reference at the front" do
      menu.add_item(item)
      expect(menu.show_items).to eq [item]#"#{item.name}....£#{item.price}"
    end

  end
end
