require "takeaway.rb"

describe Takeaway do

  let(:menu){ double :menu, list: {"Pilau rice": 1.50, "Poppadom": 0.50, "Mango Chutney": 0.30}, item_exists?: true}
  subject {described_class.new(menu: menu)}


  describe " #show_menu" do
    it "exists" do
      expect(subject).to respond_to(:show_menu)
    end

    it "returns the menu" do
      expect(subject.show_menu).to eq menu
    end

  end
  
  
  describe " #add" do
    it "can order can accept one argument" do
      expect(subject).to respond_to(:add).with(1).argument
    end
    skip " change test to return string for order" do
      it "returns item name from order" do
        expect(subject.add("Tikka Masala")).to eq "Tikka Masala"
      end
    end

    it "adds ordered item to array" do
      item = "Pilau rice"
      key_value_pair = {"Pilau rice" => 1}
      subject.add(item)
      expect(subject.order).to eq(key_value_pair)
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