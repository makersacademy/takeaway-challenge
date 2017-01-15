require "menu"

describe Menu do
  let(:menu_item_class) {double :menu_item_class,new: menu_item}
  let(:menu_item_hash)  {double :menu_item_hash}
  let(:menu_item)       {double :menu_item}
  let(:menu_loader)     {double :menu_loader,load: nil}
  let(:menu_printer)    {double :menu_printer,to_string: nil}

  let(:args) do
    {menu_printer: menu_printer,
    menu_loader: menu_loader,
    menu_item_class: menu_item_class}
  end

  subject{described_class.new args}

  describe "#creation" do
    it "should have empty menu" do
      expect(subject.items.size).to eq 0
    end
  end
  describe "#items" do
    it "should return the immutable list of menu items" do
      subject.items << 5
      expect(subject.items).not_to include 5
    end
  end
  describe "#add_to_menu" do
    it "should add an item of the right class to the menu" do
      subject.add_to_menu menu_item_hash
      expect(menu_item_class).to have_received(:new).with menu_item_hash
    end
    it "should be the same one we added" do
      subject.add_to_menu menu_item_hash
      expect(subject.items).to include menu_item
    end
  end
  describe "#get_item" do
    before(:each){subject.add_to_menu menu_item_hash}
    it "should get by ID" do
      expect(subject.get_item(1)).to eq menu_item
    end
    it "should get by name" do
      item_name = "spring rolls"
      allow(menu_item).to receive(:name).and_return(item_name)
      expect(subject.get_item(item_name)).to eq menu_item
    end
    it "should raise if given a bad ID or name" do
      message = "item not found: 2"
      expect{subject.get_item(2)}.to raise_error(RuntimeError, message)
    end
  end
  describe "#to_s" do
    it "should try to call it's printer module " do
      subject.to_s
      expect(menu_printer).to have_received(:to_string).with(subject)
    end
  end
end
