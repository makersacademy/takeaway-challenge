require "takeaway.rb"

describe Takeaway do

  let(:menu){ double :menu, list: {"Pilau rice": 1.50, "Poppadom": 0.50, "Mango Chutney": 0.30}}
  subject {described_class.new(menu: menu)}


  describe " #show_menu" do
    it "exists" do
      expect(subject).to respond_to(:show_menu)
    end

    it "returns the menu" do
      expect(subject.show_menu).to eq menu
    end

  end
  
  
  describe " #order" do
    it "can order can accept one argument" do
      expect(subject).to respond_to(:order).with(1).argument
    end

    it "returns itme name from order" do
      expect(subject.order("Tikka Masala")).to eq "Tikka Masala"
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