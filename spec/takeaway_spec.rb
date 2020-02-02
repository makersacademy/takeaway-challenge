require "takeaway.rb"

describe Takeaway do

  let(:menu){ double :menu, dishes: {"Pilau rice": 1.50, "Poppadom": 0.50 } }
  subject {described_class.new(menu: menu)}


  describe " #show_menu" do
    it "exists" do
      expect(subject).to respond_to(:show_menu)
    end

    it "returns the menu" do
      expect(subject.show_menu).to eq menu.dishes
    end

  end
  
  
  describe " #add" do
    it "can order can accept one argument" do
      expect(subject).to respond_to(:add).with(1).argument
    end

    it "adds ordered item to array" do
      item = "Pilau rice"
      key_value_pair = {"Pilau rice": 1}
      subject.add(item)
      expect(subject.order).to eq(key_value_pair)
    end

    it "raises an error if item is not in menu array" do
      item = "Not in menu"
      expect { subject.add(item) }.to raise_error("Item not in menu, please check spelling")
    end

    it "adds quanitity to already to item in hash if already ordered" do
      item = "Pilau rice"
      2.times {subject.add(item)}
      key_value_pair = {"Pilau rice": 2}
      expect(subject.order).to eq(key_value_pair)
    end
  end
  
  describe " #checkout" do
    it "returns string with ordered items" do
      allow(Calculator).to receive(:current_basket) {[{item_name: "Pilau rice", quantity: 1, subtotal: 1.50}]}
      expect(subject.checkout).to eq("Pilau rice x1 = £1.5")
    end

    it "returns string with ordered items" do
      allow(Calculator).to receive(:current_basket) {[{item_name: "Pilau rice", quantity: 1, subtotal: 1.50}, {item_name: "Poppadom", quantity: 4, subtotal: 2.00}]}
      expect(subject.checkout).to eq("Pilau rice x1 = £1.5, Poppadom x4 = £2.0")
    end
  end

  describe " #total" do

    it "should return the most up to date version of basket's total" do
      allow(Calculator).to receive(:current_basket) {[{item_name: "Pilau rice", quantity: 1, subtotal: 1.50}, {item_name: "Poppadom", quantity: 4, subtotal: 2.00}]}
      allow(Calculator).to receive(:total) {9.5}
      expect(subject.total).to eq ("Total: £9.5")
    end
  end

end