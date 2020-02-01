require "takeaway.rb"

describe Takeaway do

  let(:menu){ double :menu, list: {"Pilau rice": 1.50, "Poppadom": 0.50, "Mango Chutney": 0.30}}
  subject {described_class.new(menu: menu)}
  let(:item){"Pilau rice"}


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

    it "returns item name from order" do
      expect(subject.add("Tikka Masala")).to eq "Tikka Masala"
    end
    
    # it "adds ordered item to array" do
    #   subject.add(item)
    #   expect(subject.order).to

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