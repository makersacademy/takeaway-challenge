require "menu"

describe Menu do
  let(:menu_item_class) {double :menu_item_class,new: menu_item}
  let(:menu_item_hash)  {double :menu_item_hash}
  let(:menu_item)       {double :menu_item}
  subject{described_class.new menu_item_class}

  describe "#creation" do
    it "should have empty menu" do
      expect(subject.menu_items.size).to eq 0
    end
  end
  describe "#menu_items" do
    it "should return the immutable list of menu items" do
      subject.menu_items << 5
      expect(subject.menu_items).not_to include 5
    end
  end
  describe "#add_to_menu" do
    it "should add an item of the right class to the menu" do
      subject.add_to_menu menu_item_hash
      expect(menu_item_class).to have_received(:new).with menu_item_hash
    end
    it "should be the same one we added" do
      subject.add_to_menu menu_item_hash
      expect(subject.menu_items).to include menu_item
    end
  end
  describe "#print" #really should be a module....
end
