require "takeaway.rb"

describe Takeaway do

  let(:menu){ double :menu, dishes: {"Kolhapuri Murgi": 5.60, "Salmon Tikka Masala": 8.80, "Butter Chicken": 6.10, "Saag Paneer": 3.00, "Pilau rice": 1.50, "Coconut rice": 1.80, "Poppadom": 0.50, "Mango Chutney": 0.30}, item_exists?: true}
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
      key_value_pair = {"Pilau rice" => 1}
      subject.add(item)
      expect(subject.order).to eq(key_value_pair)
    end

    it "raises an error if iterm is not in menu array" do
      item = "Not in menu"
      expect { subject.add(item) }.to raise_error("Item not in menu, please check spelling")
    end
  end

# menu
# dishes

# basket

# text_providor

# read menu

# order ("name")

# basket_summary

# add (item, quantity)

# total

# checkout

end